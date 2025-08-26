import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/characters/domain/usecase/get_characters_usecase/get_characters_usecase.dart';
import 'package:rick_and_morty_app/features/characters/presentation/state/characters_ui_state.dart';

class CharactersViewModel extends ValueNotifier<CharactersUiState>{
  final GetCharactersUsecase _getCharactersUsecase;

  CharactersViewModel({
    required GetCharactersUsecase getCharactersUsecase,
  })
  : _getCharactersUsecase = getCharactersUsecase,
    super(CharactersUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> getAllCharacters() async {
    changeLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    final EitherOf<Failure, List<CharacterEntity>> result = await _getCharactersUsecase();
    result.get(
      (reject) => value = value.copyWith(
        errorMessage: reject.message,
      ),
      (resolve) => value = value.copyWith(
        charactersList: resolve,
      ),
    );
    changeLoading(false);
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }
}