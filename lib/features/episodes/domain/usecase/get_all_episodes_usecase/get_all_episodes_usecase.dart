import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';

abstract class GetAllEpisodesUsecase {
  Future<EitherOf<Failure, List<EpisodeEntity>>> call();
}