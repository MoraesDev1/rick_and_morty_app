import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/error/failure/general_failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/location_detail/data/datasource/location_detail_datasource/location_detail_datasource.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/repository/location_detail_repository.dart';

class LocationDetailRepositoryImp implements LocationDetailRepository {
  final LocationDetailDatasource _datasource;

  LocationDetailRepositoryImp({
    required LocationDetailDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<EitherOf<Failure, LocationEntity>> getLocationById({
    required int id,
  }) async {
    try {
      final Map<String, dynamic> response = await _datasource.getLocationById(id: id);
      return resolve(LocationEntity.fromMap(response),
      );
    } on Failure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(GeneralFailure(error: 'Não foi possível obter os detalhes da localização'));
    }
  }

  @override
  Future<EitherOf<Failure, List<CharacterEntity>>> getResidentsByIds({
    required List<String> ids,
  }) async {
    try {
      final List<Map<String, dynamic>> response = await _datasource.getResidentsByIds(ids: ids);
      final List<CharacterEntity> residents = response.map((e) => CharacterEntity.fromMap(e)).toList();
      return resolve(residents);
    } on Failure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(GeneralFailure(error: 'Não foi possível obter os residentes da localização'));
    }
  }
}