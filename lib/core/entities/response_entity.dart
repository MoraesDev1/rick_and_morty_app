class ResponseEntity<T> {
  final int? statusCode;
  final dynamic body;

  const ResponseEntity({
    this.statusCode,
    this.body,
  });
}