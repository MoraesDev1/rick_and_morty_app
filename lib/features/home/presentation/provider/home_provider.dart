import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/home/data/datasource/home_datasource/home_datasource.dart';
import 'package:rick_and_morty_app/features/home/data/datasource/home_datasource/home_datasource_imp.dart';
import 'package:rick_and_morty_app/features/home/data/repository/home_repository_imp.dart';
import 'package:rick_and_morty_app/features/home/domain/repository/home_repository.dart';
import 'package:rick_and_morty_app/features/home/domain/usecase/get_all_characters_usecase/get_all_characters_usecase.dart';
import 'package:rick_and_morty_app/features/home/domain/usecase/get_all_characters_usecase/get_all_characters_usecase_imp.dart';
import 'package:rick_and_morty_app/features/home/presentation/viewmodel/home_viewmodel.dart';

class HomeProvider {
  static void init() {
    getIt.registerFactory<HomeDatasource>(() => HomeDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<HomeRepository>(() => HomeRepositoryImp(datasource: getIt.get<HomeDatasource>()));
    getIt.registerFactory<GetAllCharactersUsecase>(() => GetAllCharactersUsecaseImp(repository: getIt.get<HomeRepository>()));
    getIt.registerFactory<HomeViewModel>(() => HomeViewModel(getAllCharactersUsecase: getIt.get<GetAllCharactersUsecase>()));
  }
}