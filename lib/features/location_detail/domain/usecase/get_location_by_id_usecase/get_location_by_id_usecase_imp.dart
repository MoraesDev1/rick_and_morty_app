import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/repository/location_detail_repository.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_location_by_id_usecase/get_location_by_id_usecase.dart';

class GetLocationByIdUsecaseImp implements GetLocationByIdUsecase {
  final LocationDetailRepository _repository;

  GetLocationByIdUsecaseImp({
    required LocationDetailRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, LocationEntity>> call({
    required int id,
  }) async {
    return await _repository.getLocationById(id: id);
  }
}