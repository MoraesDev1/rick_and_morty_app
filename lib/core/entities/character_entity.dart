import 'package:rick_and_morty_app/core/entities/location_entity.dart';
import 'package:rick_and_morty_app/core/enum/character_gender.dart';
import 'package:rick_and_morty_app/core/enum/character_status.dart';

class CharacterEntity {
  final int id;
  final String name;
  final CharacterStatus status;
  final String species;
  final String type;
  final CharacterGender gender;
  final LocationEntity origin;
  final LocationEntity location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterEntity.fromMap(Map<String, dynamic> map) {
    try {
      return CharacterEntity(
        id: int.tryParse(map['id'].toString()) ?? 0,
        name: map['name'] ?? '',
        status: CharacterStatus.fromString(map['status'] ?? ''),
        species: map['species'] ?? '',
        type: map['type'] ?? '',
        gender: CharacterGender.fromString(map['gender'] ?? ''),
        origin: LocationEntity.fromMap(map['origin'] ?? {}),
        location: LocationEntity.fromMap(map['location'] ?? {}),
        image: map['image'] ?? '',
        episode: List<String>.from(map['episode'] ?? []),
        url: map['url'] ?? '',
        created: DateTime.tryParse(map['created'] ?? '') ?? DateTime(9999, 1, 1),
      );
    } catch (e) {
      throw Exception('Erro ao converter Character: $e');
    }
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (name.isNotEmpty) map['name'] = name;
    map['status'] = status.name;
    if (species.isNotEmpty) map['species'] = species;
    if (type.isNotEmpty) map['type'] = type;
    map['gender'] = gender.name;
    map['origin'] = origin.toMap();
    map['location'] = location.toMap();
    if (image.isNotEmpty) map['image'] = image;
    if (episode.isNotEmpty) map['episode'] = episode;
    if (url.isNotEmpty) map['url'] = url;
    map['created'] = created.toIso8601String();
    return map;
  }

  CharacterEntity copyWith({
    int? id,
    String? name,
    CharacterStatus? status,
    String? species,
    String? type,
    CharacterGender? gender,
    LocationEntity? origin,
    LocationEntity? location,
    String? image,
    List<String>? episode,
    String? url,
    DateTime? created,
  }) {
    return CharacterEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }
}
