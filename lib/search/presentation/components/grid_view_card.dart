import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:filmhub_app/core/presentation/components/image_with_shimmer.dart';
import 'package:filmhub_app/core/resources/app_routes.dart';
import 'package:filmhub_app/core/resources/app_values.dart';
import 'package:filmhub_app/search/domain/entities/search_result_item.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    super.key,
    required this.item,
  });

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _getItemDetails(item,context);
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: ImageWithShimmer(
                imageUrl: item is MediaSearchResult
                    ? (item as MediaSearchResult).media.posterUrl
                    : (item as PersonSearchResult).person.profilePath!,
                width: double.infinity,
                height: AppSize.s150,
                fitType: BoxFit.fill,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            item is MediaSearchResult
                ? (item as MediaSearchResult).media.title
                : (item as PersonSearchResult).person.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

void _getItemDetails(SearchResultItem item, BuildContext context) {
  if (item is MovieSearchResult) {
    context.pushNamed(AppRoutes.movieDetailsRoute,
        pathParameters: {'movieId': item.media.tmdbID.toString()});
  } else if (item is TvShowSearchResult) {
    context.pushNamed(AppRoutes.tvShowDetailsRoute, pathParameters: {
      'tvShowId': item.media.tmdbID.toString()
    });
  } else if (item is PersonSearchResult) {
    context.pushNamed(AppRoutes.personDetailsRoute, pathParameters: {
      'personId': item.person.id.toString()
    });
  }
} 
