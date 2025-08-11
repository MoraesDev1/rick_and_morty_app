import 'package:rick_and_morty_app/core/entities/episode_entity.dart';

class EpisodesUiState {
  final bool isLoading;
  final String errorMessage;
  final List<EpisodeEntity> episodesList;
  
  EpisodesUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.episodesList,
  });

  factory EpisodesUiState.initial() {
    return EpisodesUiState(
      isLoading: false,
      errorMessage: '',
      episodesList: const <EpisodeEntity>[],
    );
  }

  EpisodesUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<EpisodeEntity>? episodesList,
  }) {
    return EpisodesUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      episodesList: episodesList ?? this.episodesList,
    );
  }
}