import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/core/utils/extensions/string_extensions.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_location_by_id_usecase/get_location_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_residents_by_id_usecase/get_residents_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/state/location_detail_ui_state.dart';

class LocationDetailViewModel extends ValueNotifier<LocationDetailUiState>{
  final GetLocationByIdUsecase _getLocationByIdUsecase;
  final GetResidentsByIdUsecase _getResidentsByIdUsecase;

  LocationDetailViewModel({
    required GetLocationByIdUsecase getLocationByIdUsecase,
    required GetResidentsByIdUsecase getResidentsByIdUsecase,
  })
  : _getLocationByIdUsecase = getLocationByIdUsecase,
    _getResidentsByIdUsecase = getResidentsByIdUsecase,
    super(LocationDetailUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> init(int id) async {
    changeLoading(true);
    await _getLocationById(id);
    if (value.location.residents.isNotEmpty) {
      List<String> residentsIds = value.location.residents.map((resident) => resident.getIdByUrl()).toList();
      await _getResidentsByIds(residentsIds);
    }
    changeLoading(false);
  }

  Future<void> _getLocationById(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    final EitherOf<Failure, LocationEntity> result = await _getLocationByIdUsecase(id: id);
    result.get(
      (reject) => value = value.copyWith(
        errorMessage: reject.message,
      ),
      (resolve) => value = value.copyWith(
        location: resolve,
      ),
    );
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }

  Future<void> _getResidentsByIds(List<String> ids) async {
    final EitherOf<Failure, List<CharacterEntity>> result = await _getResidentsByIdUsecase(ids: ids);
    result.get(
      (reject) => value = value.copyWith(
        errorMessage: reject.message,
      ),
      (resolve) => value = value.copyWith(
        residents: resolve,
      ),
    );
  }
}