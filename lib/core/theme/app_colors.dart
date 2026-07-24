import 'package:flutter/material.dart';

class AppColorsLight {
  AppColorsLight._();

  static const Color primary = Color(0xFF5B4FE5);
  static const Color primaryDark = Color(0xFF4A3FD1);
  static const Color primaryLight = Color(0xFFEDEBFC);

  static const Color background = Color(0xFFF7F5F0);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF1EFEA);

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B6B6B);
  // Darkened from 0xFF9B9B9B (~2.6:1) to meet WCAG AA (~4.5:1) on background.
  static const Color textMuted = Color(0xFF6E6E6E);

  static const Color holiday = Color(0xFFE0A030);
  static const Color overdue = Color(0xFFD64545);
  static const Color success = Color(0xFF3EA36B);
  static const Color completed = Color(0xFFB0AEA8);

  static const Color divider = Color(0xFFE8E5DE);
  static const Color timelineTrack = Color(0xFFDDD9D2);
}

class AppColorsDark {
  AppColorsDark._();

  static const Color primary = Color(0xFF7B71F0);
  static const Color primaryDark = Color(0xFF9A92F5);
  static const Color primaryLight = Color(0xFF2A2650);

  static const Color background = Color(0xFF15141C);
  static const Color surface = Color(0xFF1F1E28);
  static const Color surfaceMuted = Color(0xFF272631);

  static const Color textPrimary = Color(0xFFF2F1F5);
  static const Color textSecondary = Color(0xFFA8A6B3);
  // Lightened from 0xFF7A7885 (~3.9:1) to meet WCAG AA on dark background.
  static const Color textMuted = Color(0xFF8A8896);

  static const Color holiday = Color(0xFFE8B34D);
  static const Color overdue = Color(0xFFE86A6A);
  static const Color success = Color(0xFF4FBF82);
  static const Color completed = Color(0xFF4A4855);

  static const Color divider = Color(0xFF322F3D);
  static const Color timelineTrack = Color(0xFF3A3745);
}

extension AppColorsX on BuildContext {
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  Color get colorPrimary =>
      _isDark ? AppColorsDark.primary : AppColorsLight.primary;
  Color get colorPrimaryDark =>
      _isDark ? AppColorsDark.primaryDark : AppColorsLight.primaryDark;
  Color get colorPrimaryLight =>
      _isDark ? AppColorsDark.primaryLight : AppColorsLight.primaryLight;
  Color get colorBackground =>
      _isDark ? AppColorsDark.background : AppColorsLight.background;
  Color get colorSurface =>
      _isDark ? AppColorsDark.surface : AppColorsLight.surface;
  Color get colorSurfaceMuted =>
      _isDark ? AppColorsDark.surfaceMuted : AppColorsLight.surfaceMuted;
  Color get colorTextPrimary =>
      _isDark ? AppColorsDark.textPrimary : AppColorsLight.textPrimary;
  Color get colorTextSecondary =>
      _isDark ? AppColorsDark.textSecondary : AppColorsLight.textSecondary;
  Color get colorTextMuted =>
      _isDark ? AppColorsDark.textMuted : AppColorsLight.textMuted;
  Color get colorHoliday =>
      _isDark ? AppColorsDark.holiday : AppColorsLight.holiday;
  Color get colorOverdue =>
      _isDark ? AppColorsDark.overdue : AppColorsLight.overdue;
  Color get colorSuccess =>
      _isDark ? AppColorsDark.success : AppColorsLight.success;
  Color get colorCompleted =>
      _isDark ? AppColorsDark.completed : AppColorsLight.completed;
  Color get colorDivider =>
      _isDark ? AppColorsDark.divider : AppColorsLight.divider;
  Color get colorTimelineTrack =>
      _isDark ? AppColorsDark.timelineTrack : AppColorsLight.timelineTrack;
}
