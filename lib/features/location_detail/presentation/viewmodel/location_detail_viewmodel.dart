import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_location_by_id_usecase/get_location_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/state/location_detail_ui_state.dart';

class LocationDetailViewModel extends ValueNotifier<LocationDetailUiState>{
  final GetLocationByIdUsecase _getLocationByIdUsecase;

  LocationDetailViewModel({
    required GetLocationByIdUsecase getLocationByIdUsecase,
  })
  : _getLocationByIdUsecase = getLocationByIdUsecase,
    super(LocationDetailUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> getLocationById(int id) async {
    changeLoading(true);
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
    changeLoading(false);
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }
}