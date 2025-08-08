import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/theme/dark_theme/dark_colors.dart';

enum CharacterStatus {
  alive('Vivo', DarkColors.primary),
  dead('Morto', DarkColors.error),
  unknown('Desconhecido', DarkColors.warning);

  final String description;
  final Color color;

  const CharacterStatus(this.description, this.color);

  static fromString(String value) {
    return CharacterStatus.values.firstWhere(
      (status) => status.name.toLowerCase() == value.toLowerCase(),
      orElse: () => CharacterStatus.unknown,
    );
  }
}