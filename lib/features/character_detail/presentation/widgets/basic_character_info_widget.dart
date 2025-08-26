import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/character_status.dart';
import 'package:rick_and_morty_app/core/utils/extensions/string_extensions.dart';
import 'package:rick_and_morty_app/core/widgets/container/character_status_widget.dart';
import 'package:rick_and_morty_app/core/widgets/image/image_with_frame.dart';

class BasicCharacterInfoWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final CharacterStatus status;

  const BasicCharacterInfoWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageWithFrame(imageUrl: imageUrl),
        const SizedBox(height: 40),
        Text(
          name.toTitleCase(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 8),
        Transform.scale(
          scale: 1.2,
          child: CharacterStatusWidget(status: status),
        ),
      ],
    );
  }
}