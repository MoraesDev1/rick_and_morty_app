import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/entities/response_entity.dart';
import 'package:rick_and_morty_app/core/error/handler_error_http.dart';
import 'package:rick_and_morty_app/features/settings/data/datasource/settings_datasource/settings_datasource.dart';

class SettingsDatasourceImp implements SettingsDatasource {
  final ClientHttp _clientHttp;

  SettingsDatasourceImp({
    required ClientHttp clientHttp,
  }) : _clientHttp = clientHttp;

  @override
  Future<Map<String, dynamic>> call() async {
    try {
      final ResponseEntity<dynamic> response = await _clientHttp.get('');
      throw HandlerErrorHttp.handler(response);
    } catch (e) {
      rethrow;
    }
  }
}