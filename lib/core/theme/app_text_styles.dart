import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography tokens for the app.
///
/// Colours are intentionally NOT baked in (the only exception is the
/// [timeLabel] accent). Text inherits its colour from the theme so that light
/// and dark mode both render correctly — baking a light colour here previously
/// made text unreadable in dark mode. A comfortable [TextStyle.height] is set
/// on every style so tall Ethiopic glyphs do not clip, including at large text
/// scale.
class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'NotoSansEthiopic';

  static const TextStyle ecDateHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const TextStyle gcDateSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.35,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    height: 1.3,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  /// Accent style for times in the schedule/up-next. Keeps a colour on purpose;
  /// the primary swatch reads acceptably in both themes.
  static const TextStyle timeLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColorsLight.primary,
  );

  static const TextStyle badge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
}
