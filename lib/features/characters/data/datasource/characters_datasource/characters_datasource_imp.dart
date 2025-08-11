import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/entities/response_entity.dart';
import 'package:rick_and_morty_app/core/enum/api_endpoint.dart';
import 'package:rick_and_morty_app/core/error/handler_error_http.dart';
import 'package:rick_and_morty_app/features/characters/data/datasource/characters_datasource/characters_datasource.dart';

class CharactersDatasourceImp implements CharactersDatasource {
  final ClientHttp _clientHttp;

  CharactersDatasourceImp({
    required ClientHttp clientHttp,
  }) : _clientHttp = clientHttp;

  @override
  Future<Map<String, dynamic>> getAllCharacters() async {
    try {
      final ResponseEntity<dynamic> response = await _clientHttp.get(ApiEndpoint.characters.path);
      if (response.statusCode == 200) {
        return response.body;
      }
      throw HandlerErrorHttp.handler(response);
    } catch (e) {
      rethrow;
    }
  }
}