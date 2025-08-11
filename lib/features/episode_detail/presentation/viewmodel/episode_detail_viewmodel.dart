import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/usecase/get_episode_by_id_usecase/get_episode_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/state/episode_detail_ui_state.dart';

class EpisodeDetailViewModel extends ValueNotifier<EpisodeDetailUiState>{
  final GetEpisodeByIdUsecase _getEpisodeByIdUsecase;

  EpisodeDetailViewModel({
    required GetEpisodeByIdUsecase getEpisodeByIdUsecase,
  })
  : _getEpisodeByIdUsecase = getEpisodeByIdUsecase,
    super(EpisodeDetailUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> getEpisodeById(int id) async {
    changeLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    final EitherOf<Failure, EpisodeEntity> result = await _getEpisodeByIdUsecase(id: id);
    result.get(
      (reject) => value = value.copyWith(
        errorMessage: reject.message,
      ),
      (resolve) => value = value.copyWith(
        episode: resolve,
      ),
    );
    changeLoading(false);
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }
}