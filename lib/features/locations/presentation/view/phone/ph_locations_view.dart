import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';
import 'package:rick_and_morty_app/core/widgets/alerts/generic_alert_widget.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/main_app_bar/phone/ph_main_app_bar.dart';
import 'package:rick_and_morty_app/core/widgets/loader/full_screen_loader.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/arguments/location_detail_arguments.dart';
import 'package:rick_and_morty_app/features/locations/presentation/viewmodel/locations_viewmodel.dart';
import 'package:rick_and_morty_app/features/locations/presentation/widgets/location_card_widget.dart';

class PhLocationsView extends StatelessWidget {
  final LocationsViewModel viewModel;

  const PhLocationsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel, 
      builder: (context, value, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (value.errorMessage.isNotEmpty) {
            showDialog(
              context: context, 
              builder: (_) => GenericAlertWidget(message: value.errorMessage),
            ).then(
              (_) => viewModel.clearErrorMessage(),
            );
          }
        });
        return Column(
          children: [
            PhMainAppBar(title: AppStrings.locations),
            value.isLoading
            ? const FullScreenLoader()
            : Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemCount: value.locationsList.length,
                    itemBuilder: (context, index) {
                      final LocationEntity location = value.locationsList[index];
                      return LocationCardWidget(
                        name: location.name,
                        type: location.type,
                        onTap: () {
                          Navigator.pushNamed(
                            context, 
                            AppNamedRoutes.locationsDetail.route,
                            arguments: LocationDetailArguments(locationId: location.id)
                          );
                        }
                      );
                    }
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}