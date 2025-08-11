import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/locations/data/datasource/locations_datasource/locations_datasource.dart';
import 'package:rick_and_morty_app/features/locations/data/datasource/locations_datasource/locations_datasource_imp.dart';
import 'package:rick_and_morty_app/features/locations/data/repository/locations_repository_imp.dart';
import 'package:rick_and_morty_app/features/locations/domain/repository/locations_repository.dart';
import 'package:rick_and_morty_app/features/locations/domain/usecase/get_all_locations_usecase/get_all_locations_usecase.dart';
import 'package:rick_and_morty_app/features/locations/domain/usecase/get_all_locations_usecase/get_all_locations_usecase_imp.dart';
import 'package:rick_and_morty_app/features/locations/presentation/viewmodel/locations_viewmodel.dart';

class LocationsProvider {
  static void init() {
    getIt.registerFactory<LocationsDatasource>(() => LocationsDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<LocationsRepository>(() => LocationsRepositoryImp(datasource: getIt.get<LocationsDatasource>()));
    getIt.registerFactory<GetAllLocationsUsecase>(() => GetAllLocationsUsecaseImp(repository: getIt.get<LocationsRepository>()));
    getIt.registerFactory<LocationsViewModel>(() => LocationsViewModel(getAllLocationsUsecase: getIt.get<GetAllLocationsUsecase>()));
  }
}