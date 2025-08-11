import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/client/client_http.dart';
import 'package:rick_and_morty_app/core/client/client_http_imp.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/provider/about_me_provider.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/provider/character_detail_provider.dart';
import 'package:rick_and_morty_app/features/characters/presentation/provider/characters_provider.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/provider/episode_detail_provider.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/provider/episodes_provider.dart';
import 'package:rick_and_morty_app/features/home/presentation/provider/home_provider.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/provider/location_detail_provider.dart';
import 'package:rick_and_morty_app/features/locations/presentation/provider/locations_provider.dart';
import 'package:rick_and_morty_app/features/settings/presentation/provider/settings_provider.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupProviders() async {
  
  getIt.registerFactory<ClientHttp>(() => DioClientHttpImp());

  HomeProvider.init();
  AboutMeProvider.init();
  SettingsProvider.init();

  CharactersProvider.init();
  EpisodesProvider.init();
  LocationsProvider.init();

  EpisodeDetailProvider.init();
  CharacterDetailProvider.init();
  LocationDetailProvider.init();
}