import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/error/failure/general_failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/character_detail/data/datasource/character_detail_datasource/character_detail_datasource.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/repository/character_detail_repository.dart';

class CharacterDetailRepositoryImp implements CharacterDetailRepository {
  final CharacterDetailDatasource _datasource;

  CharacterDetailRepositoryImp({
    required CharacterDetailDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<EitherOf<Failure, CharacterEntity>> getCharacterById({
    required int id,
  }) async {
    try {
      final Map<String, dynamic> characterData = await _datasource.getCharacterById(id: id);
      return resolve(CharacterEntity.fromMap(characterData),
      );
    } on Failure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(GeneralFailure(error: 'Não foi possível obter os detalhes do personagem'));
    }
  }
}