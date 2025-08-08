import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/entities/response_entity.dart';

class DioClientHttpImp implements ClientHttp {
  final Dio _dio;

  DioClientHttpImp({
    String baseUrl = 'https://rickandmortyapi.com/api',
  }) : _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  ) {
    addInterceptor();
  }

  void addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          log('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          log('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
          return handler.next(e);
        },
      ),
    );
  }

  @override
  Future<ResponseEntity<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      
      return ResponseEntity<T>(
        statusCode: response.statusCode,
        body: response.data,
      );
    } on DioException catch (e) {
      return ResponseEntity<T>(
        statusCode: e.response?.statusCode ?? 0,
        body: e.response?.data ?? e.message,
      );
    } catch (e) {
      return ResponseEntity<T>(
        statusCode: 0,
        body: e.toString(),
      );
    }
  }

  @override
  Future<ResponseEntity<T>> post<T>(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
      );
      
      return ResponseEntity<T>(
        statusCode: response.statusCode,
        body: response.data,
      );
    } on DioException catch (e) {
      return ResponseEntity<T>(
        statusCode: e.response?.statusCode ?? 0,
        body: e.response?.data ?? e.message,
      );
    } catch (e) {
      return ResponseEntity<T>(
        statusCode: 0,
        body: e.toString(),
      );
    }
  }

  @override
  Future<ResponseEntity<T>> put<T>(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: body,
      );
      
      return ResponseEntity<T>(
        statusCode: response.statusCode,
        body: response.data,
      );
    } on DioException catch (e) {
      return ResponseEntity<T>(
        statusCode: e.response?.statusCode ?? 0,
        body: e.response?.data ?? e.message,
      );
    } catch (e) {
      return ResponseEntity<T>(
        statusCode: 0,
        body: e.toString(),
      );
    }
  }

  @override
  Future<ResponseEntity<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
      );
      
      return ResponseEntity<T>(
        statusCode: response.statusCode,
        body: response.data,
      );
    } on DioException catch (e) {
      return ResponseEntity<T>(
        statusCode: e.response?.statusCode ?? 0,
        body: e.response?.data ?? e.message,
      );
    } catch (e) {
      return ResponseEntity<T>(
        statusCode: 0,
        body: e.toString(),
      );
    }
  }
}
