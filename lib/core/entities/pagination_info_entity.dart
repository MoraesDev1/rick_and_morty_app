class PaginationInfoEntity {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const PaginationInfoEntity({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory PaginationInfoEntity.fromMap(Map<String, dynamic> map) {
    return PaginationInfoEntity(
      count: map['count'] ?? 0,
      pages: map['pages'] ?? 0,
      next: map['next'],
      prev: map['prev'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  PaginationInfoEntity copyWith({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) {
    return PaginationInfoEntity(
      count: count ?? this.count,
      pages: pages ?? this.pages,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }
}
