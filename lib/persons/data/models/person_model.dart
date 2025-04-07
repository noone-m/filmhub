import 'package:filmhub_app/core/domain/entities/person.dart';
import 'package:filmhub_app/core/utils/functions.dart';

class PersonModel extends Person {
  const PersonModel({
    required super.id,
    required super.name,
    required super.profilePath,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      name: json['name'],
      profilePath: getProfileImageUrl(json),
    );
  }  
}
