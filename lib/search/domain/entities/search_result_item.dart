import 'package:equatable/equatable.dart';
import 'package:filmhub_app/core/domain/entities/media.dart';
import 'package:filmhub_app/core/domain/entities/person.dart';

sealed class  SearchResultItem extends Equatable {}

class PersonSearchResult extends SearchResultItem {
  final Person person;
  PersonSearchResult(this.person);
  
  @override
  List<Object?> get props => [person];
}

class MediaSearchResult extends SearchResultItem{
  final Media media;
  MediaSearchResult(this.media);
  
  @override
  List<Object?> get props => [media];
}
class MovieSearchResult extends MediaSearchResult {
  MovieSearchResult(super.media);

  @override
  List<Object?> get props => [media];
}

class TvShowSearchResult extends MediaSearchResult {
  TvShowSearchResult(super.media);

  @override
  List<Object?> get props => [media];
}