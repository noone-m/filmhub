import 'package:dio/dio.dart';
import 'package:filmhub_app/core/data/error/exceptions.dart';
import 'package:filmhub_app/core/data/network/api_constants.dart';
import 'package:filmhub_app/core/data/network/error_message_model.dart';
import 'package:filmhub_app/search/data/models/search_result_item_models.dart';
import 'package:filmhub_app/search/domain/entities/search_result_item.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchResultItem>> search(String title);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {

  @override
  Future<List<SearchResultItem>> search(String title) async {
    final response = await Dio().get(ApiConstants.getSearchPath(title));
    
    if (response.statusCode == 200) {
      final List<dynamic> results = response.data['results'];

      return results.map<SearchResultItem>((json) {
        final mediaType = json['media_type'];

        if (mediaType == 'person') {
          return PersonSearchResultModel.fromJson(json);
        } else if (mediaType == 'movie') {
          return MovieSearchResultModel.fromJson(json);
        } else if (mediaType == 'tv') {
          return TvShowSearchResultModel.fromJson(json);
        } else {
          throw Exception('Unknown media type: $mediaType');
        }
      }).toList();
      
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
