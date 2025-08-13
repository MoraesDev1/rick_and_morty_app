import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/entities/response_entity.dart';
import 'package:rick_and_morty_app/core/enum/api_endpoint.dart';
import 'package:rick_and_morty_app/core/error/handler_error_http.dart';
import 'package:rick_and_morty_app/features/location_detail/data/datasource/location_detail_datasource/location_detail_datasource.dart';

class LocationDetailDatasourceImp implements LocationDetailDatasource {
  final ClientHttp _clientHttp;

  LocationDetailDatasourceImp({
    required ClientHttp clientHttp,
  }) : _clientHttp = clientHttp;

  @override
  Future<Map<String, dynamic>> getLocationById({
    required int id,
  }) async {
    try {
      final ResponseEntity<dynamic> response = await _clientHttp.get('${ApiEndpoint.locations.path}$id');
      if (response.statusCode == 200) {
        return response.body;
      }
      throw HandlerErrorHttp.handler(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getResidentsByIds({
    required List<String> ids,
  }) async {
    try {
      final String url = '${ApiEndpoint.characters.path}${ids.join(',')},';
      final ResponseEntity<dynamic> response = await _clientHttp.get(url);
      
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.body);
      }
      throw HandlerErrorHttp.handler(response);
    } catch (e) {
      rethrow;
    }
  }
}