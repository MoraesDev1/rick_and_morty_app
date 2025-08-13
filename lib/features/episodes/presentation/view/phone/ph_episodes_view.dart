import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';
import 'package:rick_and_morty_app/core/widgets/alerts/generic_alert_widget.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/main_app_bar/phone/ph_main_app_bar.dart';
import 'package:rick_and_morty_app/core/widgets/loader/full_screen_loader.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/arguments/episode_detail_arguments.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/viewmodel/episodes_viewmodel.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/widgets/episode_card_widget.dart';

class PhEpisodesView extends StatelessWidget {
  final EpisodesViewModel viewModel;

  const PhEpisodesView({super.key, required this.viewModel});

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
            PhMainAppBar(title: AppStrings.episodes),
            value.isLoading
            ? const FullScreenLoader()
            : Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: value.episodesList.map((episode) {
                      return EpisodeCardWidget(
                        name: episode.name, 
                        episode: episode.episode,
                        onTap: () {
                          Navigator.pushNamed(
                            context, 
                            AppNamedRoutes.episodesDetail.route,
                            arguments: EpisodeDetailArguments(episodeId: episode.id),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}