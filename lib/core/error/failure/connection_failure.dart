import 'package:rick_and_morty_app/core/error/failure/failure.dart';

class ConnectionFailure implements Failure {
  @override
  String get message => 'Falha na conexão com a internet';
}