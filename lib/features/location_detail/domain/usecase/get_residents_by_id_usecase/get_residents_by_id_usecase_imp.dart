import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/repository/location_detail_repository.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_residents_by_id_usecase/get_residents_by_id_usecase.dart';

class GetResidentsByIdUsecaseImp implements GetResidentsByIdUsecase {
  final LocationDetailRepository _repository;

  GetResidentsByIdUsecaseImp({
    required LocationDetailRepository repository,
  }) : _repository = repository;

  @override
  Future<EitherOf<Failure, List<CharacterEntity>>> call({
    required List<String> ids,
  }) async {
    return await _repository.getResidentsByIds(ids: ids);
  }
}