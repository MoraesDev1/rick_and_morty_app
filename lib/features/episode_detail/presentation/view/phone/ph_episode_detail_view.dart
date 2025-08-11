import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/widgets/alerts/generic_alert_widget.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/arrow_back_app_bar/phone/ph_arrow_back_app_bar.dart';
import 'package:rick_and_morty_app/core/widgets/loader/full_screen_loader.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/viewmodel/episode_detail_viewmodel.dart';

class PhEpisodeDetailView extends StatelessWidget {
  final EpisodeDetailViewModel viewModel;

  const PhEpisodeDetailView({super.key, required this.viewModel});

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 32),
                        // CircleAvatar(
                        //   radius: 80,
                        //   backgroundImage: NetworkImage(value.character.image),
                        // ),
                        // const SizedBox(height: 16),
                        // Text(
                        //   value.character.name.toTitleCase(),
                        //   textAlign: TextAlign.center,
                        //   style: Theme.of(context).textTheme.headlineMedium,
                        // ),
                        // const SizedBox(height: 8),
                        // CharacterStatusWidget(status: value.character.status),
                        // const SizedBox(height: 24),
                        // Card(
                        //   elevation: 4,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(16.0),
                        //     child: Column(
                        //       children: [
                        //         InfoRowWidget(
                        //           label: AppStrings.species,
                        //           value: value.character.species,
                        //           icon: Icons.pets,
                        //         ),
                        //         if (value.character.type.isNotEmpty) ...[
                        //           const Divider(height: 24),
                        //           InfoRowWidget(
                        //             label: AppStrings.type,
                        //             value: value.character.type,
                        //             icon: Icons.category,
                        //           ),
                        //         ],
                        //         const Divider(height: 24),
                        //         InfoRowWidget(
                        //           label: AppStrings.gender,
                        //           value: value.character.gender.description,
                        //           icon: Icons.person,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 16),
                        // Card(
                        //   elevation: 4,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(16.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           AppStrings.locations,
                        //           style: Theme.of(context).textTheme.titleMedium,
                        //         ),
                        //         const SizedBox(height: 12),
                        //         InfoRowWidget(
                        //           label: AppStrings.origin,
                        //           value: value.character.origin.name,
                        //           icon: Icons.home,
                        //         ),
                        //         const Divider(height: 24),
                        //         InfoRowWidget(
                        //           label: AppStrings.currentLocation,
                        //           value: value.character.location.name,
                        //           icon: Icons.location_on,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 16),
                        // Card(
                        //   elevation: 4,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(16.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Row(
                        //           children: [
                        //             const Icon(Icons.tv),
                        //             const SizedBox(width: 8),
                        //             Text(
                        //               '${AppStrings.episodes} (${value.character.episode.length})',
                        //               style: Theme.of(context).textTheme.titleMedium,
                        //             ),
                        //           ],
                        //         ),
                        //         const SizedBox(height: 12),
                        //         Wrap(
                        //           spacing: 8,
                        //           runSpacing: 8,
                        //           children: value.character.episode.take(10).map((episode) {
                        //             final episodeNumber = episode.split('/').last;
                        //             return Chip(
                        //               label: Text('Ep $episodeNumber'),
                        //               backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        //             );
                        //           }).toList(),
                        //         ),
                        //         if (value.character.episode.length > 10)
                        //           Padding(
                        //             padding: const EdgeInsets.only(top: 8),
                        //             child: Text(
                        //               '+ ${value.character.episode.length - 10} ${AppStrings.episodes}',
                        //               style: Theme.of(context).textTheme.bodySmall,
                        //             ),
                        //           ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 16),
                        // Card(
                        //   elevation: 4,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(16.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           AppStrings.technicalInfo,
                        //           style: Theme.of(context).textTheme.titleMedium,
                        //         ),
                        //         const SizedBox(height: 12),
                        //         InfoRowWidget(
                        //           label: AppStrings.creationDate,
                        //           value: value.character.created.formatDate(),
                        //           icon: Icons.calendar_today,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 32),
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