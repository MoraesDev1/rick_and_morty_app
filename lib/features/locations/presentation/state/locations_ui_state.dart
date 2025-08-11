import 'package:rick_and_morty_app/core/entities/location_entity.dart';

class LocationsUiState {
  final bool isLoading;
  final String errorMessage;
  final List<LocationEntity> locationsList;
  
  LocationsUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.locationsList,
  });

  factory LocationsUiState.initial() {
    return LocationsUiState(
      isLoading: false,
      errorMessage: '',
      locationsList: const <LocationEntity>[],
    );
  }

  LocationsUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<LocationEntity>? locationsList,
  }) {
    return LocationsUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      locationsList: locationsList ?? this.locationsList,
    );
  }
}