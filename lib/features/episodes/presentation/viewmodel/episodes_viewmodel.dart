import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/episodes/domain/usecase/get_all_episodes_usecase/get_all_episodes_usecase.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/state/episodes_ui_state.dart';

class EpisodesViewModel extends ValueNotifier<EpisodesUiState>{
  final GetAllEpisodesUsecase _getAllEpisodesUsecase;

  EpisodesViewModel({
    required GetAllEpisodesUsecase getAllEpisodesUsecase,
  })
  : _getAllEpisodesUsecase = getAllEpisodesUsecase,
    super(EpisodesUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> getAllEpisodes() async {
    changeLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    final EitherOf<Failure, List<EpisodeEntity>> result = await _getAllEpisodesUsecase();
    result.get(
      (reject) => value = value.copyWith(
        errorMessage: reject.message,
      ),
      (resolve) => value = value.copyWith(
        episodesList: resolve,
      ),
    );
    changeLoading(false);
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }
}