import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/core/utils/extensions/string_extensions.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/usecase/get_characters_by_id_usecase/get_characters_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/usecase/get_episode_by_id_usecase/get_episode_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/state/episode_detail_ui_state.dart';

class EpisodeDetailViewModel extends ValueNotifier<EpisodeDetailUiState>{
  final GetEpisodeByIdUsecase _getEpisodeByIdUsecase;
  final GetCharactersByIdUseCase _getCharactersByIdUseCase;

  EpisodeDetailViewModel({
    required GetEpisodeByIdUsecase getEpisodeByIdUsecase,
    required GetCharactersByIdUseCase getCharactersByIdUseCase,
  })
  : _getEpisodeByIdUsecase = getEpisodeByIdUsecase,
    _getCharactersByIdUseCase = getCharactersByIdUseCase,
    super(EpisodeDetailUiState.initial());

  Future<void> init(int id) async {
    changeLoading(true);
    await _getEpisodeById(id);
    if (value.episode.characters.isNotEmpty) {
      final List<String> ids = value.episode.characters.map((e) => e.getIdByUrl()).toList();
      await _getCharactersByIds(ids);
    }
    changeLoading(false);
  }

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> _getEpisodeById(int id) async {
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
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }

  Future<void> _getCharactersByIds(List<String> ids) async {
    final EitherOf<Failure, List<CharacterEntity>> result = await _getCharactersByIdUseCase(ids: ids);
    result.get(
      (reject) => value = value.copyWith(
        errorMessage: reject.message,
      ),
      (resolve) => value = value.copyWith(
        characters: resolve,
      ),
    );
  }
}