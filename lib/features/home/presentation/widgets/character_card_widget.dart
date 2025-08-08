import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/enum/character_status.dart';
import 'package:rick_and_morty_app/core/utils/extensions/string_extensions.dart';
import 'package:rick_and_morty_app/core/widgets/container/character_status_widget.dart';

class CharacterCardWidget extends StatelessWidget {
  final String characterName;
  final String characterImage;
  final CharacterStatus characterStatus;
  final VoidCallback onSeeDetailsPressed;

  const CharacterCardWidget({
    super.key,
    required this.characterName,
    required this.characterImage,
    required this.characterStatus,
    required this.onSeeDetailsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.44,
      height: 240,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(characterImage),
              ),
              const SizedBox(height: 12),
              Text(
                characterName.toTitleCase(),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              CharacterStatusWidget(status: characterStatus),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onSeeDetailsPressed,
                      child: const Text(AppStrings.seeDetails),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}