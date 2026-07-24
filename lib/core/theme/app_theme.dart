import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radii.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

/// Central app theme.
///
/// Beyond colours and typography, this defines **component themes** (inputs,
/// buttons, sheets, navigation, lists, chips, dialogs, snackbars) so every
/// screen inherits one cohesive, modern look without per-screen styling. Both
/// brightness variants share the same shapes and spacing tokens.
class AppTheme {
  AppTheme._();

  static ThemeData get light => _buildTheme(
    brightness: Brightness.light,
    primary: AppColorsLight.primary,
    background: AppColorsLight.background,
    surface: AppColorsLight.surface,
    surfaceMuted: AppColorsLight.surfaceMuted,
    textPrimary: AppColorsLight.textPrimary,
    textSecondary: AppColorsLight.textSecondary,
    divider: AppColorsLight.divider,
    error: AppColorsLight.overdue,
  );

  static ThemeData get dark => _buildTheme(
    brightness: Brightness.dark,
    primary: AppColorsDark.primary,
    background: AppColorsDark.background,
    surface: AppColorsDark.surface,
    surfaceMuted: AppColorsDark.surfaceMuted,
    textPrimary: AppColorsDark.textPrimary,
    textSecondary: AppColorsDark.textSecondary,
    divider: AppColorsDark.divider,
    error: AppColorsDark.overdue,
  );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color background,
    required Color surface,
    required Color surfaceMuted,
    required Color textPrimary,
    required Color textSecondary,
    required Color divider,
    required Color error,
  }) {
    // Full Material 3 text theme retargeted to the Ethiopic font and the
    // brightness-correct text colour, so every default text role renders
    // Amharic / Tigrinya / Ge'ez correctly in both light and dark mode.
    final baseTextTheme = ThemeData(brightness: brightness).textTheme.apply(
      fontFamily: AppTextStyles.fontFamily,
      bodyColor: textPrimary,
      displayColor: textPrimary,
    );

    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: brightness,
      primary: primary,
      surface: surface,
      error: error,
    );

    OutlineInputBorder inputBorder(Color color, [double width = 1]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTextStyles.fontFamily,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      colorScheme: colorScheme,
      textTheme: baseTextTheme.copyWith(
        headlineLarge: AppTextStyles.ecDateHeading.copyWith(color: textPrimary),
        titleMedium: AppTextStyles.cardTitle.copyWith(color: textPrimary),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),

      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.card),
      ),

      // Inputs: filled, rounded, quiet borders — premium and identical across
      // every form on every screen. A clear focus ring aids accessibility.
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceMuted,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        border: inputBorder(Colors.transparent),
        enabledBorder: inputBorder(Colors.transparent),
        focusedBorder: inputBorder(primary, 2),
        errorBorder: inputBorder(error),
        focusedErrorBorder: inputBorder(error, 2),
        labelStyle: TextStyle(color: textSecondary),
        hintStyle: TextStyle(color: textSecondary),
      ),

      // Buttons: comfortable ≥48dp targets, rounded, consistent everywhere.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          textStyle: AppTextStyles.cardTitle,
          shape: RoundedRectangleBorder(borderRadius: AppRadii.button),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: AppRadii.button),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          foregroundColor: textPrimary,
          side: BorderSide(color: divider),
          shape: RoundedRectangleBorder(borderRadius: AppRadii.button),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: AppTextStyles.cardSubtitle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 2,
        highlightElevation: 4,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.button),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: background,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.card),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 64,
        indicatorColor: primary.withValues(alpha: 0.14),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? primary
                : textSecondary,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => AppTextStyles.badge.copyWith(
            fontSize: 12,
            color: states.contains(WidgetState.selected)
                ? primary
                : textSecondary,
          ),
        ),
      ),

      listTileTheme: ListTileThemeData(
        iconColor: textSecondary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xs,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadii.card),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: surfaceMuted,
        selectedColor: primary.withValues(alpha: 0.14),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.badge),
        labelStyle: AppTextStyles.cardSubtitle.copyWith(color: textPrimary),
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: textPrimary,
        contentTextStyle: AppTextStyles.cardSubtitle.copyWith(color: background),
        shape: RoundedRectangleBorder(borderRadius: AppRadii.card),
      ),

      dividerTheme: DividerThemeData(color: divider, thickness: 1, space: 1),
    );
  }
}
