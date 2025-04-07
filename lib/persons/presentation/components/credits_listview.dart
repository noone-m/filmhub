import 'package:filmhub_app/core/domain/entities/media.dart';
import 'package:filmhub_app/core/presentation/components/section_listview.dart';
import 'package:filmhub_app/core/presentation/components/section_listview_card.dart';
import 'package:filmhub_app/core/resources/app_values.dart';
import 'package:flutter/material.dart';

class CreditsListView extends StatelessWidget {
  const CreditsListView({super.key, required this.credits, required this.title});

  final List<Media>? credits;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (credits != null && credits!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p4,
                horizontal: AppPadding.p16,
              ),
              child: Text(
                title,
                style: textTheme.titleSmall,
              )),
          SectionListView(
            height: AppSize.s240,
            itemCount: credits!.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: credits![index]);
            },
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
