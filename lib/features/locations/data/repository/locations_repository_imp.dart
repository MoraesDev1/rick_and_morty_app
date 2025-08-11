import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/entities/paginated_response_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/error/failure/general_failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/locations/data/datasource/locations_datasource/locations_datasource.dart';
import 'package:rick_and_morty_app/features/locations/domain/repository/locations_repository.dart';

class LocationsRepositoryImp implements LocationsRepository {
  final LocationsDatasource _datasource;

  LocationsRepositoryImp({
    required LocationsDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<EitherOf<Failure, List<LocationEntity>>> getAllLocations() async {
    try {
      final Map<String, dynamic> charactersData = await _datasource.getAllLocations();
      final PaginatedEntity paginatedResponse = PaginatedEntity.fromMap(charactersData);
      return resolve(paginatedResponse.results.map((e) => LocationEntity.fromMap(e as Map<String, dynamic>)).toList());
    } on Failure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(GeneralFailure(error: 'Não foi possível obter os locais'));
    }
  }
}