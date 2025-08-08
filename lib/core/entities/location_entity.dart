class LocationEntity {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  LocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationEntity.fromMap(Map<String, dynamic> map) {
    try {
      return LocationEntity(
        id: int.tryParse(map['id'].toString()) ?? 0,
        name: map['name'] ?? '',
        type: map['type'] ?? '',
        dimension: map['dimension'] ?? '',
        residents: List<String>.from(map['residents'] ?? []),
        url: map['url'] ?? '',
        created: DateTime.tryParse(map['created'] ?? '') ?? DateTime(9999, 1, 1),
      );
    } catch (e) {
      throw Exception('Erro ao converter Location: $e');
    }
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (name.isNotEmpty) map['name'] = name;
    if (type.isNotEmpty) map['type'] = type;
    if (dimension.isNotEmpty) map['dimension'] = dimension;
    if (residents.isNotEmpty) map['residents'] = residents;
    if (url.isNotEmpty) map['url'] = url;
    map['created'] = created.toIso8601String();
    return map;
  }

  LocationEntity copyWith({
    int? id,
    String? name,
    String? type,
    String? dimension,
    List<String>? residents,
    String? url,
    DateTime? created,
  }) {
    return LocationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      dimension: dimension ?? this.dimension,
      residents: residents ?? this.residents,
      url: url ?? this.url,
      created: created ?? this.created,
    );
  }
}
