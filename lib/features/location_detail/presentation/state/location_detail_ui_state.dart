import 'package:rick_and_morty_app/core/entities/location_entity.dart';

class LocationDetailUiState {
  final bool isLoading;
  final String errorMessage;
  final LocationEntity location;
  
  LocationDetailUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.location,
  });

  factory LocationDetailUiState.initial() {
    return LocationDetailUiState(
      isLoading: false,
      errorMessage: '',
      location: LocationEntity.fromMap({}),
    );
  }

  LocationDetailUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    LocationEntity? location,
  }) {
    return LocationDetailUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      location: location ?? this.location,
    );
  }
}