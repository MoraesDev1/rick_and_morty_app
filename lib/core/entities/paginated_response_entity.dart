import 'package:rick_and_morty_app/core/entities/pagination_info_entity.dart';

class PaginatedEntity<T> {
  final PaginationInfoEntity info;
  final List<dynamic> results;

  PaginatedEntity({
    required this.info,
    required this.results,
  });

  factory PaginatedEntity.fromMap(
    Map<String, dynamic> map,
  ) {
    return PaginatedEntity(
      info: PaginationInfoEntity.fromMap(map['info'] ?? {}),
      results: (map['results'] as List<dynamic>? ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'info': info.toMap(),
      'results': results,
    };
  }

  PaginatedEntity<T> copyWith({
    PaginationInfoEntity? info,
    List<dynamic>? results,
  }) {
    return PaginatedEntity(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }
}
