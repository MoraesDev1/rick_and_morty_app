import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';

abstract class LocationDetailRepository {
  Future<EitherOf<Failure, LocationEntity>> getLocationById({
    required int id,
  });
}