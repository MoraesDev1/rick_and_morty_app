import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/features/about_me/data/datasource/about_me_datasource/about_me_datasource.dart';

class AboutMeDatasourceImp implements AboutMeDatasource {
  final ClientHttp _clientHttp;

  AboutMeDatasourceImp({
    required ClientHttp clientHttp,
  }) : _clientHttp = clientHttp;

  @override
  Future<Map<String, dynamic>> getAboutMeData() async {
    try {
      // Assuming there's an endpoint for fetching "about me" data
      final response = await _clientHttp.get('/about_me');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load about me data');
      }
    } catch (e) {
      throw Exception('Error fetching about me data: $e');
    }
  }
}