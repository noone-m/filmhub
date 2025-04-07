import 'package:dartz/dartz.dart';
import 'package:filmhub_app/core/data/error/failure.dart';
import 'package:filmhub_app/core/domain/entities/media.dart';
import 'package:filmhub_app/core/domain/entities/person_details.dart';

abstract class PersonsRepository {
  Future<Either<Failure,PersonDetails>> getPersonDetails(int personId);
  Future<Either<Failure,List<Media>>> getPersonMovies(int personId);
  Future<Either<Failure,List<Media>>> getPersonTvShows(int personId);
} 