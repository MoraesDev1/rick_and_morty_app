import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';
import 'package:rick_and_morty_app/features/about_me/presentation/view/about_me_view_module.dart';
import 'package:rick_and_morty_app/features/building/view/building_view_module.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/arguments/character_detail_arguments.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/view/character_detail_view_module.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_view_module.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/arguments/episode_detail_arguments.dart';
import 'package:rick_and_morty_app/features/episode_detail/presentation/view/episode_detail_view_module.dart';
import 'package:rick_and_morty_app/features/episodes/presentation/view/episodes_view_module.dart';
import 'package:rick_and_morty_app/features/home/presentation/view/home_view_module.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/arguments/location_detail_arguments.dart';
import 'package:rick_and_morty_app/features/location_detail/presentation/view/location_detail_view_module.dart';
import 'package:rick_and_morty_app/features/locations/presentation/view/locations_view_module.dart';
import 'package:rick_and_morty_app/features/settings/presentation/view/settings_view_module.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final Map<String, Widget Function(BuildContext context)> routes = <String, Widget Function(BuildContext context)>{
    ///Generic features routes
    AppNamedRoutes.home.route: (context) => const HomeViewModule(),
    AppNamedRoutes.building.route: (context) => const BuildingViewModule(),
    AppNamedRoutes.aboutMe.route: (context) => const AboutMeViewModule(),
    AppNamedRoutes.settings.route: (context) => const SettingsViewModule(),
    ///Main Features routes
    AppNamedRoutes.characters.route: (context) => const CharactersViewModule(),
    AppNamedRoutes.episodes.route: (context) => const EpisodesViewModule(),
    AppNamedRoutes.locations.route: (context) => const LocationsViewModule(),
    ///Detail routes
    AppNamedRoutes.characterDetail.route: (context) {
      final CharacterDetailArguments args = ModalRoute.of(context)?.settings.arguments as CharacterDetailArguments;
      return CharacterDetailViewModule(args: args);
    },
    AppNamedRoutes.episodesDetail.route: (context) {
      final EpisodeDetailArguments args = ModalRoute.of(context)?.settings.arguments as EpisodeDetailArguments;
      return EpisodeDetailViewModule(args: args);
    },
    AppNamedRoutes.locationsDetail.route: (context) {
      final LocationDetailArguments args = ModalRoute.of(context)?.settings.arguments as LocationDetailArguments;
      return LocationDetailViewModule(args: args);
    },
  };
}