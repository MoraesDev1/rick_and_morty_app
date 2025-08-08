import 'package:rick_and_morty_app/core/entities/response_entity.dart';

abstract class ClientHttp {
  Future<ResponseEntity<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<ResponseEntity<T>> post<T>(
    String path, {
    Map<String, dynamic>? body,
  });

  Future<ResponseEntity<T>> put<T>(
    String path, {
    Map<String, dynamic>? body,
  });
  
  Future<ResponseEntity<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}