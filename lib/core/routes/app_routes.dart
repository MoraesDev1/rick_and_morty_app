import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';
import 'package:rick_and_morty_app/features/building/view/building_view_module.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/arguments/character_detail_arguments.dart';
import 'package:rick_and_morty_app/features/character_detail/presentation/view/character_detail_view_module.dart';
import 'package:rick_and_morty_app/features/home/presentation/view/home_view_module.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final Map<String, Widget Function(BuildContext context)> routes = <String, Widget Function(BuildContext context)>{
    AppNamedRoutes.home.route: (context) => const HomeViewModule(),
    AppNamedRoutes.building.route: (context) => const BuildingViewModule(),
    AppNamedRoutes.characterDetail.route: (context) {
      final CharacterDetailArguments args = ModalRoute.of(context)?.settings.arguments as CharacterDetailArguments;
      return CharacterDetailViewModule(args: args);
    },
  };
}