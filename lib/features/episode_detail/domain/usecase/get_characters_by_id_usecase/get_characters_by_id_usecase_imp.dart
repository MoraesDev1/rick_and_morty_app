import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/repository/episode_detail_repository.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/usecase/get_characters_by_id_usecase/get_characters_by_id_usecase.dart';

class GetCharactersByIdUsecaseImp implements GetCharactersByIdUseCase {
  final EpisodeDetailRepository _repository;

  GetCharactersByIdUsecaseImp({
    required EpisodeDetailRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, List<CharacterEntity>>> call({
    required List<String> ids,
  }) async {
    return await _repository.getMultipleCharactersByIds(ids: ids);
  }
}