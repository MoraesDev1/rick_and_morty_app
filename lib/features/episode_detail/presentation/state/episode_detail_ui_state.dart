import 'package:rick_and_morty_app/core/entities/episode_entity.dart';

class EpisodeDetailUiState {
  final bool isLoading;
  final String errorMessage;
  final EpisodeEntity episode;
  
  EpisodeDetailUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.episode,
  });

  factory EpisodeDetailUiState.initial() {
    return EpisodeDetailUiState(
      isLoading: false,
      errorMessage: '',
      episode: EpisodeEntity.fromMap({}),
    );
  }

  EpisodeDetailUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    EpisodeEntity? episode,
  }) {
    return EpisodeDetailUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      episode: episode ?? this.episode,
    );
  }
}