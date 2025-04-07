part of 'person_details_bloc.dart';

abstract class PersonDetailsEvent extends Equatable {
  const PersonDetailsEvent();
}

class GetPersonDetailsEvent extends PersonDetailsEvent {
  final int id;
  const GetPersonDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
