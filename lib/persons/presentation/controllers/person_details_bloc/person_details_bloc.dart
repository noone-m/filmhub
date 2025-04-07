import 'package:equatable/equatable.dart';
import 'package:filmhub_app/core/domain/entities/person_details.dart';
import 'package:filmhub_app/core/utils/enums.dart';
import 'package:filmhub_app/persons/domain/usecases/get_person_details_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'person_details_event.dart';
part 'person_details_state.dart';


class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  final GetPersonDetailsUsecase _getPersonsDetailsUseCase;

  PersonDetailsBloc(this._getPersonsDetailsUseCase)
      : super(const PersonDetailsState()) {
    on<GetPersonDetailsEvent>(_getPersonDetails);
  }

  Future<void> _getPersonDetails(
      GetPersonDetailsEvent event, Emitter<PersonDetailsState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await _getPersonsDetailsUseCase(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          personDetails: r,
        ),
      ),
    );
  }
}
