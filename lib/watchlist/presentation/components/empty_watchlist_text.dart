import 'package:flutter/material.dart';
import 'package:filmhub_app/core/resources/app_strings.dart';
import 'package:filmhub_app/core/resources/app_values.dart';

class EmptyWatchlistText extends StatelessWidget {
  const EmptyWatchlistText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.watchlistIsEmpty,
          style: textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p6),
          child: Text(
            AppStrings.watchlistText,
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ));
  }
}
