import 'package:rick_and_morty_app/core/entities/character_entity.dart';

class CharacterDetailUiState {
  final bool isLoading;
  final String errorMessage;
  final CharacterEntity character;
  
  CharacterDetailUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.character,
  });

  factory CharacterDetailUiState.initial() {
    return CharacterDetailUiState(
      isLoading: false,
      errorMessage: '',
      character: CharacterEntity.fromMap({}),
    );
  }

  CharacterDetailUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    CharacterEntity? character,
  }) {
    return CharacterDetailUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      character: character ?? this.character,
    );
  }
}