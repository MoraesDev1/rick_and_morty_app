import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/features/characters/data/datasource/characters_datasource/characters_datasource.dart';
import 'package:rick_and_morty_app/features/characters/data/datasource/characters_datasource/characters_datasource_imp.dart';
import 'package:rick_and_morty_app/features/characters/data/repository/characters_repository_imp.dart';
import 'package:rick_and_morty_app/features/characters/domain/repository/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/domain/usecase/get_characters_usecase/get_characters_usecase.dart';
import 'package:rick_and_morty_app/features/characters/domain/usecase/get_characters_usecase/get_characters_usecase_imp.dart';
import 'package:rick_and_morty_app/features/characters/presentation/viewmodel/characters_viewmodel.dart';

class CharactersProvider {
  static void init() {
    getIt.registerFactory<CharactersDatasource>(() => CharactersDatasourceImp(clientHttp: getIt.get<ClientHttp>()));
    getIt.registerFactory<CharactersRepository>(() => CharactersRepositoryImp(datasource: getIt.get<CharactersDatasource>()));
    getIt.registerFactory<GetCharactersUsecase>(() => GetCharactersUsecaseImp(repository: getIt.get<CharactersRepository>()));
    getIt.registerFactory<CharactersViewModel>(() => CharactersViewModel(getCharactersUsecase: getIt.get<GetCharactersUsecase>()));
  }
}