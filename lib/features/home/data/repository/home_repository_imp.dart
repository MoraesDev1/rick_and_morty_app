import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/paginated_response_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/error/failure/general_failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/home/data/datasource/home_datasource/home_datasource.dart';
import 'package:rick_and_morty_app/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDatasource _datasource;

  HomeRepositoryImp({
    required HomeDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<EitherOf<Failure, List<CharacterEntity>>> getAllCharacters() async {
    try {
      final Map<String, dynamic> charactersData = await _datasource.getAllCharacters();
      final PaginatedEntity paginatedResponse = PaginatedEntity.fromMap(charactersData);
      return resolve(paginatedResponse.results.map((e) => CharacterEntity.fromMap(e as Map<String, dynamic>)).toList());
    } on Failure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(GeneralFailure(error: 'Não foi possível obter os personagens'));
    }
  }
}