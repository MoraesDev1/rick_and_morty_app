import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/error/failure/general_failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/episode_detail/data/datasource/episode_detail_datasource/episode_detail_datasource.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/repository/episode_detail_repository.dart';

class EpisodeDetailRepositoryImp implements EpisodeDetailRepository {
  final EpisodeDetailDatasource _datasource;

  EpisodeDetailRepositoryImp({
    required EpisodeDetailDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<EitherOf<Failure, EpisodeEntity>> getEpisodeById({
    required int id,
  }) async {
    try {
      final Map<String, dynamic> response = await _datasource.getEpisodeById(id: id);
      return resolve(EpisodeEntity.fromMap(response),
      );
    } on Failure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(GeneralFailure(error: 'Não foi possível obter os detalhes do personagem'));
    }
  }

  @override
  Future<EitherOf<Failure, List<CharacterEntity>>> getMultipleCharactersByIds({
    required List<String> ids,
  }) async {
    try {
      final List<Map<String, dynamic>> response = await _datasource.getMultipleCharactersByIds(ids: ids);
      final List<CharacterEntity> characters = response.map((characterMap) => CharacterEntity.fromMap(characterMap)).toList();
      return resolve(characters);
    } on Failure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(GeneralFailure(error: 'Não foi possível obter os detalhes dos personagens'));
    }
  }
}