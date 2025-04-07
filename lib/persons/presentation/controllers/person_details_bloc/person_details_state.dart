part of 'person_details_bloc.dart';



class PersonDetailsState {
  final PersonDetails? personDetails;
  final RequestStatus status;
  final String message;

  const PersonDetailsState({
    this.personDetails,
    this.status = RequestStatus.loading,
    this.message = '',
  });

  PersonDetailsState copyWith({
    PersonDetails? personDetails,
    RequestStatus? status,
    String? message,
  }) {
    return PersonDetailsState(
      personDetails: personDetails ?? this.personDetails,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
