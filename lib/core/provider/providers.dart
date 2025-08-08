import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/client/client_http_imp.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/provider/character_detail_provider.dart';
import 'package:rick_and_morty_app/features/home/presentation/provider/home_provider.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupProviders() async {
  getIt.registerFactory<ClientHttp>(() => DioClientHttpImp());
  HomeProvider.init();
  CharacterDetailProvider.init();
}