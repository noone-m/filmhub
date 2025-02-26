import 'package:dartz/dartz.dart';
import 'package:filmhub_app/core/data/error/failure.dart';
import 'package:filmhub_app/search/domain/entities/search_result_item.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResultItem>>> search(String title);
}
