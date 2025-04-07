import 'package:dartz/dartz.dart';
import 'package:filmhub_app/core/data/error/failure.dart';
import 'package:filmhub_app/core/domain/entities/media.dart';
import 'package:filmhub_app/core/domain/usecase/base_use_case.dart';
import 'package:filmhub_app/persons/domain/repository/persons_repository.dart';

class GetPesonMoviesUsecase extends BaseUseCase<List<Media>,int> {
  final PersonsRepository _basePersonsRepository;

  GetPesonMoviesUsecase(this._basePersonsRepository);

  @override
  Future<Either<Failure,List<Media>>> call(int personId) async{
    return await _basePersonsRepository.getPersonMovies(personId);
  }
} 