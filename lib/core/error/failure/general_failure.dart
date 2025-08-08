import 'package:rick_and_morty_app/core/error/failure/failure.dart';

class GeneralFailure implements Failure {
  final String? error;

  GeneralFailure({required this.error});

  @override
  String get message => error ?? 'Ocorreu um erro não especificado';
}