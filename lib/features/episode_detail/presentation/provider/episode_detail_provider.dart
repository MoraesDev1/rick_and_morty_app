import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/episode_detail/data/datasource/episode_detail_datasource/episode_detail_datasource.dart';
import 'package:rick_and_morty_app/features/episode_detail/data/datasource/episode_detail_datasource/episode_detail_datasource_imp.dart';
import 'package:rick_and_morty_app/features/episode_detail/data/repository/episode_detail_repository_imp.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/repository/episode_detail_repository.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/usecase/get_episode_by_id_usecase/get_episode_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/episode_detail/domain/usecase/get_episode_by_id_usecase/get_episode_by_id_usecase_imp.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/viewmodel/episode_detail_viewmodel.dart';

class EpisodeDetailProvider {
  static void init() {
    getIt.registerFactory<EpisodeDetailDatasource>(() => EpisodeDetailDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<EpisodeDetailRepository>(() => EpisodeDetailRepositoryImp(datasource: getIt.get<EpisodeDetailDatasource>()));
    getIt.registerFactory<GetEpisodeByIdUsecase>(() => GetEpisodeByIdUsecaseImp(repository: getIt.get<EpisodeDetailRepository>()));
    getIt.registerFactory<EpisodeDetailViewModel>(() => EpisodeDetailViewModel(getEpisodeByIdUsecase: getIt.get<GetEpisodeByIdUsecase>()));
  }
}