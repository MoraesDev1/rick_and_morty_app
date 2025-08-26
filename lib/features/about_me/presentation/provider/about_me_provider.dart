import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/about_me/data/datasource/about_me_datasource/about_me_datasource.dart';
import 'package:rick_and_morty_app/features/about_me/data/datasource/about_me_datasource/about_me_datasource_imp.dart';
import 'package:rick_and_morty_app/features/about_me/data/repository/about_me_repository_imp.dart';
import 'package:rick_and_morty_app/features/about_me/domain/repository/about_me_repository.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/viewmodel/about_me_viewmodel.dart';

class AboutMeProvider {
  static void init() {
    getIt.registerFactory<AboutMeDatasource>(() => AboutMeDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<AboutMeRepository>(() => AboutMeRepositoryImp(datasource: getIt.get<AboutMeDatasource>()));
    getIt.registerFactory<AboutMeViewModel>(() => AboutMeViewModel());
  }
}