import 'package:rick_and_morty_app/core/entities/response_entity.dart';
import 'package:rick_and_morty_app/core/error/failure/bad_request_failure.dart';
import 'package:rick_and_morty_app/core/error/failure/connection_failure.dart';
import 'package:rick_and_morty_app/core/error/failure/failure.dart';
import 'package:rick_and_morty_app/core/error/failure/general_failure.dart';
import 'package:rick_and_morty_app/core/error/failure/unauthorized_failure.dart';

class HandlerErrorHttp {
  static Failure handler(ResponseEntity<dynamic> response) {
    return switch (response.statusCode) {
      null || 0 => ConnectionFailure(),
      400 => BadRequestFailure(),
      401 => UnauthorizedFailure(),
      504 => ConnectionFailure(),
      500 => GeneralFailure(error: response.body),
      _ => GeneralFailure(error: response.body),
    };
  }
}