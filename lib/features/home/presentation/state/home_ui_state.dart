import 'package:rick_and_morty_app/core/entities/character_entity.dart';

class HomeUiState {
  final bool isLoading;
  final String errorMessage;
  final List<CharacterEntity> charactersList;
  
  HomeUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.charactersList,
  });

  factory HomeUiState.initial() {
    return HomeUiState(
      isLoading: false,
      errorMessage: '',
      charactersList: const <CharacterEntity>[],
    );
  }

  HomeUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CharacterEntity>? charactersList,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      charactersList: charactersList ?? this.charactersList,
    );
  }
}