import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/locations/domain/repository/locations_repository.dart';
import 'package:rick_and_morty_app/features/locations/domain/usecase/get_all_locations_usecase/get_all_locations_usecase.dart';

class GetAllLocationsUsecaseImp implements GetAllLocationsUsecase {
  final LocationsRepository _repository;

  GetAllLocationsUsecaseImp({
    required LocationsRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, List<LocationEntity>>> call() async {
    return await _repository.getAllLocations();
  }
}