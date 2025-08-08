import 'package:rick_and_morty_app/core/error/failure/failure.dart';

class BadRequestFailure implements Failure {
  @override
  String get message => 'Requisição inválida';
}