import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/repository/episode_detail_repository.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/usecase/get_episode_by_id_usecase/get_episode_by_id_usecase.dart';

class GetEpisodeByIdUsecaseImp implements GetEpisodeByIdUsecase {
  final EpisodeDetailRepository _repository;

  GetEpisodeByIdUsecaseImp({
    required EpisodeDetailRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, EpisodeEntity>> call({
    required int id,
  }) async {
    return await _repository.getEpisodeById(id: id);
  }
}