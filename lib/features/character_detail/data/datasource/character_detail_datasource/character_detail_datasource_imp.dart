import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/entities/response_entity.dart';
import 'package:rick_and_morty_app/core/enum/api_endpoint.dart';
import 'package:rick_and_morty_app/core/error/handler_error_http.dart';
import 'package:rick_and_morty_app/features/character_detail/data/datasource/character_detail_datasource/character_detail_datasource.dart';

class CharacterDetailDatasourceImp implements CharacterDetailDatasource {
  final ClientHttp _clientHttp;

  CharacterDetailDatasourceImp({
    required ClientHttp clientHttp,
  }) : _clientHttp = clientHttp;

  @override
  Future<Map<String, dynamic>> getCharacterById({
    required int id,
  }) async {
    try {
      final ResponseEntity<dynamic> response = await _clientHttp.get('${ApiEndpoint.characters.path}$id');
      if (response.statusCode == 200) {
        return response.body;
      }
      throw HandlerErrorHttp.handler(response);
    } catch (e) {
      rethrow;
    }
  }
}