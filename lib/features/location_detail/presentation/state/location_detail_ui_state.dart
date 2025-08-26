import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/location_entity.dart';

class LocationDetailUiState {
  final bool isLoading;
  final String errorMessage;
  final LocationEntity location;
  final List<CharacterEntity> residents;
  
  LocationDetailUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.location,
    required this.residents,
  });

  factory LocationDetailUiState.initial() {
    return LocationDetailUiState(
      isLoading: false,
      errorMessage: '',
      location: LocationEntity.fromMap({}),
      residents: [],
    );
  }

  LocationDetailUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    LocationEntity? location,
    List<CharacterEntity>? residents,
  }) {
    return LocationDetailUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      location: location ?? this.location,
      residents: residents ?? this.residents,
    );
  }
}