import 'package:rick_and_morty_app/core/entities/character_entity.dart';

class CharacterDetailUiState {
  final bool isLoading;
  final String errorMessage;
  final CharacterEntity character;
  final bool showAllEpisodes;
  
  CharacterDetailUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.character,
    required this.showAllEpisodes,
  });

  factory CharacterDetailUiState.initial() {
    return CharacterDetailUiState(
      isLoading: false,
      errorMessage: '',
      character: CharacterEntity.fromMap({}),
      showAllEpisodes: false,
    );
  }

  List<String> get episodeListSummary {
    return character.episode.take(10).toList();
  }

  CharacterDetailUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    CharacterEntity? character,
    bool? showAllEpisodes,
  }) {
    return CharacterDetailUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      character: character ?? this.character,
      showAllEpisodes: showAllEpisodes ?? this.showAllEpisodes,
    );
  }
}