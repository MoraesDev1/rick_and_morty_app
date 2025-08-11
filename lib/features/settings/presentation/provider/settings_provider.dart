import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/settings/data/datasource/settings_datasource/settings_datasource.dart';
import 'package:rick_and_morty_app/features/settings/data/datasource/settings_datasource/settings_datasource_imp.dart';
import 'package:rick_and_morty_app/features/settings/data/repository/_repository_imp.dart';
import 'package:rick_and_morty_app/features/settings/domain/repository/settings_repository.dart';
import 'package:rick_and_morty_app/features/settings/presentation/viewmodel/settings_viewmodel.dart';

class SettingsProvider {
  static void init() {
    getIt.registerFactory<SettingsDatasource>(() => SettingsDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<SettingsRepository>(() => SettingsRepositoryImp(datasource: getIt.get<SettingsDatasource>()));
    getIt.registerFactory<SettingsViewModel>(() => SettingsViewModel());
  }
}