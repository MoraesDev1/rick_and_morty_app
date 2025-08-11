import 'package:rick_and_morty_app/features/settings/data/datasource/settings_datasource/settings_datasource.dart';
import 'package:rick_and_morty_app/features/settings/domain/repository/settings_repository.dart';

class SettingsRepositoryImp implements SettingsRepository {
  final SettingsDatasource _datasource;

  SettingsRepositoryImp({
    required SettingsDatasource datasource,
  }) : _datasource = datasource;

  Future<Map<String, dynamic>> getSettings() async {
    try {
      return await _datasource.call();
    } catch (e) {
      rethrow;
    }
  }
}