import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/widgets/alerts/generic_alert_widget.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/main_app_bar/phone/ph_main_app_bar.dart';
import 'package:rick_and_morty_app/core/widgets/loader/full_screen_loader.dart';
import 'package:rick_and_morty_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:rick_and_morty_app/features/home/presentation/widgets/top_locations_carousel_widget.dart';
import 'package:rick_and_morty_app/features/home/presentation/widgets/wanted_carousel_widget.dart';

class PhHomeView extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const PhHomeView({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: homeViewModel, 
      builder: (context, value, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (value.errorMessage.isNotEmpty) {
            showDialog(
              context: context, 
              builder: (_) => GenericAlertWidget(message: value.errorMessage),
            ).then(
              (_) => homeViewModel.clearErrorMessage(),
            );
          }
        });
        return Column(
          children: [
            PhMainAppBar(title: AppStrings.home),
            value.isLoading
            ? const FullScreenLoader()
            : Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      WantedCarousel(wantedCharacters: value.wantedCharacters),
                      TopLocationsCarousel(mostVisitedLocations: value.mostVisitedLocations),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}