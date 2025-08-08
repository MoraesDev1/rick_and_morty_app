import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/character_status.dart';

class CharacterStatusWidget extends StatelessWidget {
  final CharacterStatus status;

  const CharacterStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.description,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}