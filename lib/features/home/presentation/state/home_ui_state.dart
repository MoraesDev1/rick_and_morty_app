import 'dart:math';

import 'package:rick_and_morty_app/core/entities/character_entity.dart';
import 'package:rick_and_morty_app/core/entities/location_entity.dart';

class HomeUiState {
  final bool isLoading;
  final String errorMessage;
  final List<CharacterEntity> charactersList;
  
  HomeUiState({
    required this.isLoading,
    required this.errorMessage,
    required this.charactersList,
  });

  factory HomeUiState.initial() {
    return HomeUiState(
      isLoading: false,
      errorMessage: '',
      charactersList: const <CharacterEntity>[],
    );
  }

  List<CharacterEntity> get wantedCharacters {
    if (charactersList.isEmpty) return [];
    
    final random = Random();
    final shuffledList = List<CharacterEntity>.from(charactersList);
    shuffledList.shuffle(random);
    
    return shuffledList.take(5).toList();
  }

  List<LocationEntity> get mostVisitedLocations {
    if (charactersList.isEmpty) return [];
    
    final locationCount = <String, int>{};
    final locationMap = <String, LocationEntity>{};

    for (var character in charactersList) {
      final location = character.location;
      locationCount[location.name] = (locationCount[location.name] ?? 0) + 1;
      locationMap[location.name] = location;
        }

    final sortedLocations = locationCount.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedLocations
        .take(5)
        .map((entry) => locationMap[entry.key]!)
        .toList();
  }

  HomeUiState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CharacterEntity>? charactersList,
  }) {
    return HomeUiState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      charactersList: charactersList ?? this.charactersList,
    );
  }
}