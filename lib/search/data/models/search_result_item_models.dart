import 'package:filmhub_app/movies/data/models/movie_model.dart';
import 'package:filmhub_app/persons/data/models/person_model.dart';
import 'package:filmhub_app/search/domain/entities/search_result_item.dart';
import 'package:filmhub_app/tv_shows/data/models/tv_show_model.dart';

class PersonSearchResultModel extends PersonSearchResult{
  PersonSearchResultModel(super.person);
  
  factory PersonSearchResultModel.fromJson(Map<String, dynamic> json) {
    return PersonSearchResultModel(
      PersonModel.fromJson(json)
    );
  }

  @override
  String toString() {
    return super.person.toString();
  }
}


class MovieSearchResultModel extends MovieSearchResult{
  MovieSearchResultModel(super.media);
  
  factory MovieSearchResultModel.fromJson(Map<String, dynamic> json) {
    return MovieSearchResultModel(
      MovieModel.fromJson(json)
    );
  }
}


class TvShowSearchResultModel extends TvShowSearchResult{
  TvShowSearchResultModel(super.media);
  
  factory TvShowSearchResultModel.fromJson(Map<String, dynamic> json) {
    return TvShowSearchResultModel(
      TVShowModel.fromJson(json)
    );
  }
}