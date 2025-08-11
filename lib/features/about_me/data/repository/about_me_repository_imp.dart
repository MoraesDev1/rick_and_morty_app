import 'package:rick_and_morty_app/features/about_me/data/datasource/about_me_datasource/about_me_datasource.dart';
import 'package:rick_and_morty_app/features/about_me/domain/repository/about_me_repository.dart';

class AboutMeRepositoryImp implements AboutMeRepository {
  final AboutMeDatasource _datasource;

  AboutMeRepositoryImp({
    required AboutMeDatasource datasource,
  }) : _datasource = datasource;

  Future<Map<String, dynamic>> getAboutMe() async {
    try {
      // Assuming the datasource has a method to fetch about me data
      final Map<String, dynamic> aboutMeData = await _datasource.getAboutMeData();
      return aboutMeData;
    } catch (e) {
      // Handle any errors that may occur during the data fetching
      throw Exception('Failed to fetch about me data: $e');
    }
  }
}