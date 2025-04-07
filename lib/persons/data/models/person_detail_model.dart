import 'package:filmhub_app/core/domain/entities/person_details.dart';
import 'package:filmhub_app/core/utils/functions.dart';

class PersonDetailsModel extends PersonDetails {
  const PersonDetailsModel(
      {required super.id,
      required super.name,
      required super.birthday,
      required super.biography,
      required super.knownForDepartment,
      required super.movieCredits,
      required super.tvShowCredits,
      super.deathday,
      required super.profilePath,
      super.facebook,
      super.instagram});

  factory PersonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PersonDetailsModel(
      id: json['id'],
      name: json['name'],
      birthday: DateTime.parse(json['birthday']),
      deathday:
          json['deathday'] != null ? DateTime.parse(json['deathday']) : null,
      biography: json['biography'],
      knownForDepartment: json['known_for_department'],
      profilePath: getProfileImageUrl(json),
      facebook: json['facebook_id'],
      instagram: json['instagram_id'],
      movieCredits: json['movie_credits'],
      tvShowCredits: json['tv_credits'],
    );
  }

  @override
  String toString() {
    return '''
      PersonDetailsModel(
          id: $id,
          name: $name,
          birthday: $birthday,
          deathday: $deathday,
          biography: $biography,
          knownForDepartment: $knownForDepartment,
          profilePath: $profilePath,
          facebook: $facebook,
          instagram: $instagram,
          movieCredits: $movieCredits,
          tvShowCredits: $tvShowCredits
      )''';
  }
}
