import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/character_detail/data/datasource/character_detail_datasource/character_detail_datasource.dart';
import 'package:rick_and_morty_app/features/character_detail/data/datasource/character_detail_datasource/character_detail_datasource_imp.dart';
import 'package:rick_and_morty_app/features/character_detail/data/repository/character_detail_repository_imp.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/repository/character_detail_repository.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/usecase/get_character_by_id_usecase/get_character_by_id_usecase.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/usecase/get_character_by_id_usecase/get_character_by_id_usecase_imp.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/viewmodel/character_detail_viewmodel.dart';

class CharacterDetailProvider {
  static void init() {
    getIt.registerFactory<CharacterDetailDatasource>(() => CharacterDetailDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<CharacterDetailRepository>(() => CharacterDetailRepositoryImp(datasource: getIt.get<CharacterDetailDatasource>()));
    getIt.registerFactory<GetCharacterByIdUsecase>(() => GetCharacterByIdUsecaseImp(repository: getIt.get<CharacterDetailRepository>()));
    getIt.registerFactory<CharacterDetailViewModel>(() => CharacterDetailViewModel(getCharacterByIdUsecase: getIt.get<GetCharacterByIdUsecase>()));
  }
}