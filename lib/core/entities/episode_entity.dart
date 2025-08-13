class EpisodeEntity {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;

  EpisodeEntity({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodeEntity.fromMap(Map<String, dynamic> map) {
    try {
      return EpisodeEntity(
        id: int.tryParse(map['id'].toString()) ?? 0,
        name: map['name'] ?? '',
        airDate: map['air_date'] ?? '',
        episode: map['episode'] ?? '',
        characters: List<String>.from(map['characters'] ?? []),
        url: map['url'] ?? '',
        created: DateTime.tryParse(map['created'] ?? '') ?? DateTime(9999, 1, 1),
      );
    } catch (e) {
      throw Exception('Erro ao converter Episode: $e');
    }
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (name.isNotEmpty) map['name'] = name;
    if (airDate.isNotEmpty) map['air_date'] = airDate;
    if (episode.isNotEmpty) map['episode'] = episode;
    if (characters.isNotEmpty) map['characters'] = characters;
    if (url.isNotEmpty) map['url'] = url;
    map['created'] = created.toIso8601String();
    return map;
  }

  EpisodeEntity copyWith({
    int? id,
    String? name,
    String? airDate,
    String? episode,
    List<String>? characters,
    String? url,
    DateTime? created,
  }) {
    return EpisodeEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      airDate: airDate ?? this.airDate,
      episode: episode ?? this.episode,
      characters: characters ?? this.characters,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }
}
