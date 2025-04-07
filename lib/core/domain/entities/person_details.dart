import 'package:filmhub_app/core/domain/entities/media.dart';

class PersonDetails {
  final int id;
  final String name;
  final String profilePath;
  final DateTime birthday;
  final DateTime? deathday;
  final String biography;
  final String knownForDepartment;
  final List<Media>? movieCredits;
  final List<Media>? tvShowCredits;
  final String? facebook;
  final String? instagram;

  const PersonDetails({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.birthday,
    this.deathday,
    required this.biography,
    required this.knownForDepartment,
    required this.movieCredits,
    required this.tvShowCredits,
    this.facebook,
    this.instagram,
  });

}
