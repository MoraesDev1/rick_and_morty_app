import 'package:rick_and_morty_app/core/error/failure/failure.dart';

class UnauthorizedFailure implements Failure {
  @override
  String get message => 'Acesso não autorizado';
}