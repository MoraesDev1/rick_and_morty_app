import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';
import 'package:rick_and_morty_app/core/widgets/alerts/generic_alert_widget.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/arrow_back_app_bar/phone/ph_arrow_back_app_bar.dart';
import 'package:rick_and_morty_app/core/widgets/loader/full_screen_loader.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/state/character_detail_ui_state.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/viewmodel/character_detail_viewmodel.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/widgets/basic_character_info_widget.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/widgets/episode_chip_widget.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/widgets/info_card_widget.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/widgets/info_row_widget.dart';

class PhCharacterDetailView extends StatelessWidget {
  final CharacterDetailViewModel characterDetailViewModel;

  const PhCharacterDetailView({super.key, required this.characterDetailViewModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: characterDetailViewModel, 
      builder: (context,CharacterDetailUiState value, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (value.errorMessage.isNotEmpty) {
            showDialog(
              context: context, 
              builder: (_) => GenericAlertWidget(message: value.errorMessage),
            ).then(
              (_) => characterDetailViewModel.clearErrorMessage(),
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
                        SizedBox(height: 16),
                        BasicCharacterInfoWidget(
                          imageUrl: value.character.image, 
                          name: value.character.name, 
                          status: value.character.status,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InfoCardWidget(
                                titleLabel: AppStrings.species,
                                titleValue: value.character.species,
                                type: value.character.type,
                                iconPath: AssetsPaths.speciesIcon.path,
                              ),
                              InfoCardWidget(
                                titleLabel: AppStrings.gender,
                                titleValue: value.character.gender.description, 
                                type: '',
                                iconPath: AssetsPaths.genderIcon.path,
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              spacing: 12,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.locations,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                InfoRowWidget(
                                  label: AppStrings.origin,
                                  value: value.character.origin.name,
                                  iconPath: AssetsPaths.originIcon.path,
                                  onTap: () {},
                                ),
                                InfoRowWidget(
                                  label: AppStrings.currentLocation,
                                  value: value.character.location.name,
                                  iconPath: AssetsPaths.currentLocationIcon.path,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  spacing: 8,
                                  children: [
                                    const Icon(Icons.tv),
                                    Text(
                                      '${AppStrings.episodes} (${value.character.episode.length})',
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    if (value.character.episode.length > 10) Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                            onPressed: characterDetailViewModel.changeShowAllEpisodes,
                                            style: ButtonStyle(
                                              shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              side: WidgetStateProperty.all(
                                                BorderSide(color: Theme.of(context).colorScheme.primary),
                                              ),
                                            ),
                                            child: Text(
                                              value.showAllEpisodes ? AppStrings.seeLess : AppStrings.seeAll, 
                                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                color: Theme.of(context).colorScheme.primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeIn,
                                  alignment: Alignment.topCenter,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: (value.showAllEpisodes
                                    ? value.character.episode
                                    : value.episodeListSummary
                                    ).map((episode) => EpisodeChipWidget(
                                      episode: episode, 
                                      onTap: () {},//TODO: Implement episode detail navigation
                                    )).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
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