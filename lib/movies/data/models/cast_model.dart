import 'package:filmhub_app/core/utils/functions.dart';
import 'package:filmhub_app/movies/domain/entities/cast.dart';

class CastModel extends Cast {
  const CastModel({
    required super.id,
    required super.name,
    required super.profileUrl,
    required super.gender,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'],
      name: json['name'],
      profileUrl: getProfileImageUrl(json),
      gender: json['gender'],
    );
  }
}
