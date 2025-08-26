import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/utils/either_of/either_of.dart';
import 'package:rick_and_morty_app/features/locations/domain/usecase/get_all_locations_usecase/get_all_locations_usecase.dart';
import 'package:rick_and_morty_app/features/locations/presentation/state/locations_ui_state.dart';

class LocationsViewModel extends ValueNotifier<LocationsUiState>{
  final GetAllLocationsUsecase _getAllLocationsUsecase;

  LocationsViewModel({
    required GetAllLocationsUsecase getAllLocationsUsecase,
  })
  : _getAllLocationsUsecase = getAllLocationsUsecase,
    super(LocationsUiState.initial());

  void changeLoading(bool isLoading) {
    value = value.copyWith(isLoading: isLoading);
  }

  Future<void> getAllLocations() async {
    changeLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    final EitherOf<Failure, List<LocationEntity>> result = await _getAllLocationsUsecase();
    result.get(
      (reject) => value = value.copyWith(
        errorMessage: reject.message,
      ),
      (resolve) => value = value.copyWith(
        locationsList: resolve,
      ),
    );
    changeLoading(false);
  }

  void clearErrorMessage() {
    value = value.copyWith(errorMessage: '');
  }
}