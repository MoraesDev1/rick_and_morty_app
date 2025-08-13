import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/theme/dark_theme/dark_colors.dart';

class DarkTheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkColors.background,
    primaryColor: DarkColors.primary,
    colorScheme: ColorScheme.dark(
      primary: DarkColors.primary,
      secondary: DarkColors.secondary,
      error: DarkColors.error,
      onPrimary: DarkColors.textPrimary,
      onSecondary: DarkColors.textSecondary,
      onError: DarkColors.textPrimary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: DarkColors.secondary,
      titleTextStyle: TextStyle(
        color: DarkColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      surfaceTintColor: DarkColors.secondary,
    ),
    cardTheme: CardThemeData(
      color: DarkColors.tertiary.withAlpha(180),
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: DarkColors.textPrimary),
      bodyMedium: TextStyle(color: DarkColors.textPrimary),
      bodySmall: TextStyle(color: DarkColors.textPrimary),
      headlineLarge: TextStyle(color: DarkColors.textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: DarkColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: DarkColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
      labelLarge: TextStyle(color: DarkColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(color: DarkColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(color: DarkColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(color: DarkColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: DarkColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(color: DarkColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
      displayLarge: TextStyle(color: DarkColors.textPrimary, fontSize: 57, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: DarkColors.textPrimary, fontSize: 45, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: DarkColors.textPrimary, fontSize: 36, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkColors.secondary,
        foregroundColor: DarkColors.textPrimary,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: DarkColors.tertiary,
    ),
    dialogTheme: DialogThemeData(
      shadowColor: Colors.transparent,
      backgroundColor: DarkColors.tertiary,
      contentTextStyle: TextStyle(color: DarkColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w500),
    )
  );
}