import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';
import 'package:rick_and_morty_app/core/widgets/alerts/generic_alert_widget.dart';
import 'package:rick_and_morty_app/core/widgets/appbar/main_app_bar/phone/ph_main_app_bar.dart';
import 'package:rick_and_morty_app/core/widgets/loader/full_screen_loader.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/arguments/character_detail_arguments.dart';
import 'package:rick_and_morty_app/features/characters/presentation/viewmodel/characters_viewmodel.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_card_widget.dart';

class PhCharactersView extends StatelessWidget {
  final CharactersViewModel viewModel;

  const PhCharactersView({super.key, required this.viewModel});

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
            PhMainAppBar(title: 'Personagens'),
            value.isLoading
            ? const FullScreenLoader()
            : Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: value.charactersList.map((character) {
                      return CharacterCardWidget(
                        characterName: character.name,
                        characterImage: character.image,
                        characterStatus: character.status,
                        onSeeDetailsPressed: () {
                          Navigator.of(context).pushNamed(
                            AppNamedRoutes.characterDetail.route,
                            arguments: CharacterDetailArguments(characterId: character.id),
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