import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_radii.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _buildTheme(
        brightness: Brightness.light,
        primary: AppColorsLight.primary,
        background: AppColorsLight.background,
        surface: AppColorsLight.surface,
        textPrimary: AppColorsLight.textPrimary,
        divider: AppColorsLight.divider,
      );

  static ThemeData get dark => _buildTheme(
        brightness: Brightness.dark,
        primary: AppColorsDark.primary,
        background: AppColorsDark.background,
        surface: AppColorsDark.surface,
        textPrimary: AppColorsDark.textPrimary,
        divider: AppColorsDark.divider,
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color background,
    required Color surface,
    required Color textPrimary,
    required Color divider,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: brightness,
        primary: primary,
        surface: surface,
        error: brightness == Brightness.dark
            ? AppColorsDark.overdue
            : AppColorsLight.overdue,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStyles.ecDateHeading.copyWith(color: textPrimary),
        titleMedium: AppTextStyles.cardTitle.copyWith(color: textPrimary),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.card),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
      dividerTheme: DividerThemeData(color: divider, thickness: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
      ),
    );
  }
}
