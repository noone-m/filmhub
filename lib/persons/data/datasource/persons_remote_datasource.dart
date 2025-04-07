import 'package:dio/dio.dart';
import 'package:filmhub_app/core/data/error/exceptions.dart';
import 'package:filmhub_app/core/data/network/api_constants.dart';
import 'package:filmhub_app/core/data/network/error_message_model.dart';
import 'package:filmhub_app/movies/data/models/movie_model.dart';
import 'package:filmhub_app/persons/data/models/person_detail_model.dart';
import 'package:filmhub_app/tv_shows/data/models/tv_show_model.dart';

abstract class PersonsRemoteDatasource {
  Future<List<MovieModel>> getPersonMovies(int personId);
  Future<List<TVShowModel>> getPersonTVshows(int personId);
  Future<PersonDetailsModel> getPersonDetails(int personId);
}

class PersonsRemoteDatasourceImpl extends PersonsRemoteDatasource {
  @override
  Future<PersonDetailsModel> getPersonDetails(int personId) async {
    // Run all API calls in parallel
    final responses = await Future.wait([
      Dio().get(ApiConstants.getPersonDetailsPath(personId)),
      Dio().get(ApiConstants.getPersonExternalIds(personId)),
      getPersonMovies(personId),
      getPersonTVshows(personId),
    ]);

    final personResponse = responses[0] as Response;
    final socialResponse = responses[1] as Response;

    if (personResponse.statusCode != 200) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(personResponse.data),
      );
    }

    if (socialResponse.statusCode != 200) {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(socialResponse.data),
      );
    }

    return PersonDetailsModel.fromJson({
      ...personResponse.data, // Person details
      ...socialResponse.data,
      'movie_credits': responses[2],
      'tv_credits': responses[3],
    });
  }

  @override
  Future<List<MovieModel>> getPersonMovies(int personId) async {
    final response =
        await Dio().get(ApiConstants.getPersonMoviesPath(personId));
    if (response.statusCode == 200) {
      return [
        ...List<MovieModel>.from(
            (response.data['crew'] as List).map((e) => MovieModel.fromJson(e))),
        ...List<MovieModel>.from(
            (response.data['cast'] as List).map((e) => MovieModel.fromJson(e))),
      ];
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TVShowModel>> getPersonTVshows(int personId) async {
    final response =
        await Dio().get(ApiConstants.getPersonTVshowsPath(personId));
    if (response.statusCode == 200) {
      return [
        ...List<TVShowModel>.from((response.data['crew'] as List)
            .map((e) => TVShowModel.fromJson(e))),
        ...List<TVShowModel>.from((response.data['cast'] as List)
            .map((e) => TVShowModel.fromJson(e))),
      ];
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
