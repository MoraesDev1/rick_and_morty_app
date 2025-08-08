import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/enum/named_routes.dart';
import 'package:rick_and_morty_app/core/provider/providers.dart';
import 'package:rick_and_morty_app/core/routes/app_routes.dart';
import 'package:rick_and_morty_app/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupProviders();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty Wiki',
      theme: AppTheme.dark,
      routes: AppRoutes.routes,
      initialRoute: AppNamedRoutes.home.route,
      navigatorKey: navigatorKey,
    );
  }
}
