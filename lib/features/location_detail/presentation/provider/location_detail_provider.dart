import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/location_detail/data/datasource/location_detail_datasource/location_detail_datasource.dart';
import 'package:rick_and_morty_app/features/location_detail/data/datasource/location_detail_datasource/location_detail_datasource_imp.dart';
import 'package:rick_and_morty_app/features/location_detail/data/repository/location_detail_repository_imp.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/repository/location_detail_repository.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_location_by_id_usecase/get_location_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_location_by_id_usecase/get_location_by_id_usecase_imp.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_residents_by_id_usecase/get_residents_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/location_detail/domain/usecase/get_residents_by_id_usecase/get_residents_by_id_usecase_imp.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/viewmodel/location_detail_viewmodel.dart';

class LocationDetailProvider {
  static void init() {
    getIt.registerFactory<LocationDetailDatasource>(() => LocationDetailDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<LocationDetailRepository>(() => LocationDetailRepositoryImp(datasource: getIt.get<LocationDetailDatasource>()));
    getIt.registerFactory<GetLocationByIdUsecase>(() => GetLocationByIdUsecaseImp(repository: getIt.get<LocationDetailRepository>()));
    getIt.registerFactory<GetResidentsByIdUsecase>(() => GetResidentsByIdUsecaseImp(repository: getIt.get<LocationDetailRepository>()));
    getIt.registerFactory<LocationDetailViewModel>(() => LocationDetailViewModel(
      getLocationByIdUsecase: getIt.get<GetLocationByIdUsecase>(), 
      getResidentsByIdUsecase: getIt.get<GetResidentsByIdUsecase>(),
    ));
  }
}