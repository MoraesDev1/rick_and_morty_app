import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';

abstract class CharacterDetailRepository {
  Future<EitherOf<Failure, CharacterEntity>> getCharacterById({
    required int id,
  });
}