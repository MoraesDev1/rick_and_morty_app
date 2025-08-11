import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/episodes/domain/repository/episodes_repository.dart';
import 'package:rick_and_morty_app/features/episodes/domain/usecase/get_all_episodes_usecase/get_all_episodes_usecase.dart';

class GetAllEpisodesUsecaseImp implements GetAllEpisodesUsecase {
  final EpisodesRepository _repository;

  GetAllEpisodesUsecaseImp({
    required EpisodesRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, List<EpisodeEntity>>> call() async {
    return await _repository.getAllEpisodes();
  }
}