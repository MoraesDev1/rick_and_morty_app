import 'package:rick_and_morty_app/core/entities/episode_entity.dart';
import 'package:rick_and_morty_app/core/entities/paginated_response_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/error/failure/general_failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/episodes/data/datasource/episodes_datasource/episodes_datasource.dart';
import 'package:rick_and_morty_app/features/episodes/domain/repository/episodes_repository.dart';

class EpisodesRepositoryImp implements EpisodesRepository {
  final EpisodesDatasource _datasource;

  EpisodesRepositoryImp({
    required EpisodesDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<EitherOf<Failure, List<EpisodeEntity>>> getAllEpisodes() async {
    try {
      final Map<String, dynamic> charactersData = await _datasource.getAllEpisodes();
      final PaginatedEntity paginatedResponse = PaginatedEntity.fromMap(charactersData);
      return resolve(paginatedResponse.results.map((e) => EpisodeEntity.fromMap(e as Map<String, dynamic>)).toList());
    } on Failure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(GeneralFailure(error: 'Não foi possível obter os episódios'));
    }
  }
}