import 'package:filmhub_app/core/domain/entities/person_details.dart';
import 'package:filmhub_app/core/presentation/components/error_screen.dart';
import 'package:filmhub_app/core/presentation/components/loading_indicator.dart';
import 'package:filmhub_app/core/resources/app_strings.dart';
import 'package:filmhub_app/core/resources/app_values.dart';
import 'package:filmhub_app/core/services/service_locator.dart';
import 'package:filmhub_app/core/utils/enums.dart';
import 'package:filmhub_app/persons/presentation/components/credits_listview.dart';
import 'package:filmhub_app/persons/presentation/components/person_details_card.dart';
import 'package:filmhub_app/persons/presentation/controllers/person_details_bloc/person_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetailsView extends StatelessWidget {
  final int personId;

  const PersonDetailsView({
    super.key,
    required this.personId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            sl<PersonDetailsBloc>()..add(GetPersonDetailsEvent(personId)),
        child: Scaffold(body: BlocBuilder<PersonDetailsBloc, PersonDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return PersonDetailsWidget(personDetails: state.personDetails!);
              case RequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context
                        .read<PersonDetailsBloc>()
                        .add(GetPersonDetailsEvent(personId));
                  },
                );
            }
          },
        )));
  }
}

class PersonDetailsWidget extends StatelessWidget {
  const PersonDetailsWidget({
    required this.personDetails,
    super.key,
  });

  final PersonDetails personDetails;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _getPeresonCard(personDetails, screenWidth),
        _getPersonBiography(personDetails.biography, textTheme),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPadding.p6,
          ),
        ),
        CreditsListView(
          credits: personDetails.movieCredits,
          title: AppStrings.movies,
        ),
        CreditsListView(
            credits: personDetails.tvShowCredits, title: AppStrings.shows),
      ]),
    );
  }
}

Widget _getPeresonCard(PersonDetails personDetails, double screenWidth) {
  return screenWidth <= 600
      ? PersonDetailsCard(
          personInfo: personDetails,
          width: double.infinity,
        )
      : PersonDetailsCard(
          personInfo: personDetails,
          width: screenWidth * 0.4,
        );
}

Widget _getPersonBiography(String biography, TextTheme textTheme) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p6,
            horizontal: AppPadding.p16,
          ),
          child: Text(
            AppStrings.biography,
            style: textTheme.titleSmall,
          )),
      Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p6,
            horizontal: AppPadding.p16,
          ),
          child: Text(biography,style: TextStyle(fontSize: AppSize.s14),)),
    ],
  );
}

