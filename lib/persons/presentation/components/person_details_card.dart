import 'package:filmhub_app/core/domain/entities/person_details.dart';
import 'package:filmhub_app/core/presentation/components/slider_card_image.dart';
import 'package:filmhub_app/core/resources/app_strings.dart';
import 'package:filmhub_app/core/resources/app_values.dart';
import 'package:filmhub_app/core/utils/functions.dart';
import 'package:flutter/material.dart';

class PersonDetailsCard extends StatelessWidget {
  const PersonDetailsCard({super.key, required this.personInfo, required this.width});

  final PersonDetails personInfo;
  final double width;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: SizedBox(
      width: width,
      child: Column(
        children: [
          Stack(
            children: [
              SliderCardImage(
                imageUrl: personInfo.profilePath,
                fitType: BoxFit.fill,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.5),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: Text(
                      personInfo.name,
                      style: textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16,
                    ),
                    child: Row(
                      children: [
                        Text(
                          getDate(
                              "${personInfo.birthday.year}-${personInfo.birthday.month}-${personInfo.birthday.day}"),
                          style: textTheme.bodyMedium,
                        ),
                        Text(' - ', style: textTheme.bodyMedium),
                        Text(
                            personInfo.deathday != null
                                ? getDate(
                                    "${personInfo.deathday!.year}-${personInfo.deathday!.month}-${personInfo.deathday!.day}")
                                : AppStrings.now,
                            style: textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
