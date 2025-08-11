import 'package:rick_and_morty_app/core/entities/character_entity.dart';

class CharactersUiState {
  final bool isLoading;
  final String errorMessage;
  final List<CharacterEntity> charactersList;
  
  CharactersUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.charactersList,
  });

  factory CharactersUiState.initial() {
    return CharactersUiState(
      isLoading: false,
      errorMessage: '',
      charactersList: const <CharacterEntity>[],
    );
  }

  CharactersUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CharacterEntity>? charactersList,
  }) {
    return CharactersUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      charactersList: charactersList ?? this.charactersList,
    );
  }
}