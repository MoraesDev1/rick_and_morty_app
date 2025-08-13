import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/widgets/alerts/generic_alert_widget.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/arrow_back_app_bar/phone/ph_arrow_back_app_bar.dart';
import 'package:rick_and_morty_app/core/widgets/loader/full_screen_loader.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/viewmodel/location_detail_viewmodel.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/widgets/location_detail_header_widget.dart';

class PhLocationDetailView extends StatelessWidget {
  final LocationDetailViewModel viewModel;

  const PhLocationDetailView({super.key, required this.viewModel});

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
            PhArrowBackAppBar(title: AppStrings.details),
            value.isLoading
            ? const FullScreenLoader()
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 4),
                        LocationDetailHeaderWidget(
                          name: value.location.name, 
                          type: value.location.type, 
                          dimension: value.location.dimension,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(12),
                            child: Column(
                              spacing: 12,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    AppStrings.residents,
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ),
                                ),
                                value.location.residents.isEmpty
                                ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            AppStrings.noResidents,
                                            style: Theme.of(context).textTheme.bodyMedium,
                                            textAlign: TextAlign.center,
                                          ),
                                      ],
                                    ),
                                  ],
                                )
                                : Wrap(
                                    runSpacing: 8,
                                    spacing: 8,
                                    children: value.residents.map((resident) {
                                      return SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: Image(
                                                  image: NetworkImage(resident.image), 
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                                  child: Tooltip(
                                                    message: resident.name,
                                                    triggerMode: TooltipTriggerMode.tap,
                                                    showDuration: const Duration(seconds: 2),
                                                    verticalOffset: 24,
                                                    preferBelow: false,
                                                    enableTapToDismiss: true,
                                                    child: Text(
                                                      resident.name,
                                                      style: Theme.of(context).textTheme.titleMedium,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}