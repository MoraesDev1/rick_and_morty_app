import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';
import 'package:rick_and_morty_app/core/enum/character_status.dart';
import 'package:rick_and_morty_app/core/utils/extensions/string_extensions.dart';
import 'package:rick_and_morty_app/core/widgets/container/character_status_widget.dart';

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
        SizedBox(
          width: 150,
          height: 150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 144,
                  height: 144,
                  fit: BoxFit.cover,
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 10),
                child: Transform.scale(
                  scale: 1.5,
                  child: Image.asset(
                    AssetsPaths.frame.path,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
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