import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/consts/app_strings.dart';
import 'package:rick_and_morty_app/core/enum/assets_paths.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(AssetsPaths.avatar.path),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Mr. Poopybutthole',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text(AppStrings.home),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppNamedRoutes.home.route,
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(AppStrings.characters),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppNamedRoutes.building.route,
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text(AppStrings.places),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppNamedRoutes.building.route,
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.movie),
                  title: Text(AppStrings.episodes),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppNamedRoutes.building.route,
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(AppStrings.settings),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppNamedRoutes.building.route,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(AppStrings.logout),
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings
            },
          ),
        ],
      ),
    );
  }
}