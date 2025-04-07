import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:filmhub_app/core/data/error/exceptions.dart';
import 'package:filmhub_app/core/data/error/failure.dart';
import 'package:filmhub_app/core/domain/entities/media.dart';
import 'package:filmhub_app/core/domain/entities/person_details.dart';
import 'package:filmhub_app/persons/data/datasource/persons_remote_datasource.dart';
import 'package:filmhub_app/persons/domain/repository/persons_repository.dart';

class PersonsRepositoryImpl extends PersonsRepository{
  final PersonsRemoteDatasource _baseRemoteDatasource;

  PersonsRepositoryImpl(this._baseRemoteDatasource);

  @override
  Future<Either<Failure, PersonDetails>> getPersonDetails(int personId) async{
    try {
      final result = await _baseRemoteDatasource.getPersonDetails(personId);
      print('result is $result');
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.toString()));
    }    
  }

  @override
  Future<Either<Failure, List<Media>>> getPersonMovies(int personId) async {
    try {
      final result = await _baseRemoteDatasource.getPersonMovies(personId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getPersonTvShows(int personId) async {
    try {
      final result = await _baseRemoteDatasource.getPersonTVshows(personId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioException catch (failure) {
      return Left(ServerFailure(failure.toString()));
    }
  }

}