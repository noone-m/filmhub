import 'package:filmhub_app/core/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:filmhub_app/core/presentation/components/image_with_shimmer.dart';

import 'package:filmhub_app/movies/domain/entities/cast.dart';
import 'package:filmhub_app/core/resources/app_values.dart';
import 'package:go_router/go_router.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({
    required this.cast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
        onTap: () {
          context.goNamed(AppRoutes.personDetailsRoute,pathParameters:{'personId':'${cast.id}'});
        },
        child: SizedBox(
          width: AppSize.s100,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s8),
                child: ImageWithShimmer(
                  imageUrl: cast.profileUrl,
                  width: double.infinity,
                  height: AppSize.s130,
                  fitType: BoxFit.fill,
                ),
              ),
              Text(
                cast.name,
                style: textTheme.bodyLarge,
                maxLines: 2,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
