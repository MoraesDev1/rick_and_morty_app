import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/entities/response_entity.dart';
import 'package:rick_and_morty_app/core/enum/api_endpoint.dart';
import 'package:rick_and_morty_app/core/error/handler_error_http.dart';
import 'package:rick_and_morty_app/features/episodes/data/datasource/episodes_datasource/episodes_datasource.dart';

class EpisodesDatasourceImp implements EpisodesDatasource {
  final ClientHttp _clientHttp;

  EpisodesDatasourceImp({
    required ClientHttp clientHttp,
  }) : _clientHttp = clientHttp;

  @override
  Future<Map<String, dynamic>> getAllEpisodes() async {
    try {
      final ResponseEntity<dynamic> response = await _clientHttp.get(ApiEndpoint.episodes.path);
      if (response.statusCode == 200) {
        return response.body;
      }
      throw HandlerErrorHttp.handler(response);
    } catch (e) {
      rethrow;
    }
  }
}