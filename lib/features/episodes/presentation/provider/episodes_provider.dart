import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/episodes/data/datasource/episodes_datasource/episodes_datasource.dart';
import 'package:rick_and_morty_app/features/episodes/data/datasource/episodes_datasource/episodes_datasource_imp.dart';
import 'package:rick_and_morty_app/features/episodes/data/repository/episodes_repository_imp.dart';
import 'package:rick_and_morty_app/features/episodes/domain/repository/episodes_repository.dart';
import 'package:rick_and_morty_app/features/episodes/domain/usecase/get_all_episodes_usecase/get_all_episodes_usecase.dart';
import 'package:rick_and_morty_app/features/episodes/domain/usecase/get_all_episodes_usecase/get_all_episodes_usecase_imp.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/viewmodel/episodes_viewmodel.dart';

class EpisodesProvider {
  static void init() {
    getIt.registerFactory<EpisodesDatasource>(() => EpisodesDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<EpisodesRepository>(() => EpisodesRepositoryImp(datasource: getIt.get<EpisodesDatasource>()));
    getIt.registerFactory<GetAllEpisodesUsecase>(() => GetAllEpisodesUsecaseImp(repository: getIt.get<EpisodesRepository>()));
    getIt.registerFactory<EpisodesViewModel>(() => EpisodesViewModel(getAllEpisodesUsecase: getIt.get<GetAllEpisodesUsecase>()));
  }
}