
import 'package:dartz/dartz.dart';
import 'package:filmhub_app/core/data/error/failure.dart';
import 'package:filmhub_app/core/domain/entities/person_details.dart';
import 'package:filmhub_app/core/domain/usecase/base_use_case.dart';
import 'package:filmhub_app/persons/domain/repository/persons_repository.dart';

class GetPersonDetailsUsecase extends BaseUseCase<PersonDetails,int> {
  final PersonsRepository _basePersonsRepository;

  GetPersonDetailsUsecase(this._basePersonsRepository);

  @override
  Future<Either<Failure,PersonDetails>> call(int personId) async{
    return await _basePersonsRepository.getPersonDetails(personId);
  }
} 