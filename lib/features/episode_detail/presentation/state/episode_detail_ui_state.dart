import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/episode_entity.dart';

class EpisodeDetailUiState {
  final bool isLoading;
  final String errorMessage;
  final EpisodeEntity episode;
  final List<CharacterEntity> characters;
  
  EpisodeDetailUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.episode,
    required this.characters,
  });

  factory EpisodeDetailUiState.initial() {
    return EpisodeDetailUiState(
      isLoading: false,
      errorMessage: '',
      episode: EpisodeEntity.fromMap({}),
      characters: [],
    );
  }

  EpisodeDetailUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    EpisodeEntity? episode,
    List<CharacterEntity>? characters,
  }) {
    return EpisodeDetailUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      episode: episode ?? this.episode,
      characters: characters ?? this.characters,
    );
  }
}