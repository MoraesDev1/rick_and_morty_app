import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';

abstract class EpisodeDetailRepository {
  Future<EitherOf<Failure, EpisodeEntity>> getEpisodeById({
    required int id,
  });

  Future<EitherOf<Failure, List<CharacterEntity>>> getMultipleCharactersByIds({
    required List<String> ids,
  });
}