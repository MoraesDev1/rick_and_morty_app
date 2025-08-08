import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/home/domain/repository/home_repository.dart';
import 'package:rick_and_morty_app/features/home/domain/usecase/get_all_characters_usecase/get_all_characters_usecase.dart';

class GetAllCharactersUsecaseImp implements GetAllCharactersUsecase {
  final HomeRepository _repository;

  GetAllCharactersUsecaseImp({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, List<CharacterEntity>>> call() async {
    return await _repository.getAllCharacters();
  }
}