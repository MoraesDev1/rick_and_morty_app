import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/characters/domain/repository/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/domain/usecase/get_characters_usecase/get_characters_usecase.dart';

class GetCharactersUsecaseImp implements GetCharactersUsecase {
  final CharactersRepository _repository;

  GetCharactersUsecaseImp({
    required CharactersRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, List<CharacterEntity>>> call() async {
    return await _repository.getAllCharacters();
  }
}