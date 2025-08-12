import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/usecase/get_character_by_id_usecase/get_character_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/state/character_detail_ui_state.dart';

class CharacterDetailViewModel extends ValueNotifier<CharacterDetailUiState>{
  final GetCharacterByIdUsecase _getCharacterByIdUsecase;

  CharacterDetailViewModel({
    required GetCharacterByIdUsecase getCharacterByIdUsecase,
  })
  : _getCharacterByIdUsecase = getCharacterByIdUsecase,
    super(CharacterDetailUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> getCharacterById(int id) async {
    changeLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    final EitherOf<Failure, CharacterEntity> result = await _getCharacterByIdUsecase(id: id);
    result.get(
      (reject) => value = value.copyWith(
        errorMessage: reject.message,
      ),
      (resolve) => value = value.copyWith(
        character: resolve,
      ),
    );
    changeLoading(false);
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }

  void changeShowAllEpisodes() {
    value = value.copyWith(showAllEpisodes: !value.showAllEpisodes);
  }
}