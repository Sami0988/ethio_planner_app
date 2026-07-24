import 'package:flutter/widgets.dart';

/// Centralized motion tokens for consistent, accessible animation.
///
/// Durations collapse to [Duration.zero] and curves flatten when the user has
/// enabled "reduce motion" at the OS level, so any screen can honour
/// accessibility (ACC-FR) with one call:
///
/// ```dart
/// AnimatedContainer(duration: context.motion.medium, ...)
/// ```
class AppMotion {
  const AppMotion._(this.reduce);

  /// Whether the OS "reduce motion" setting is active.
  final bool reduce;

  factory AppMotion.of(BuildContext context) =>
      AppMotion._(MediaQuery.maybeOf(context)?.disableAnimations ?? false);

  static const Duration _fast = Duration(milliseconds: 150);
  static const Duration _medium = Duration(milliseconds: 250);
  static const Duration _slow = Duration(milliseconds: 400);

  /// Quick feedback (press states, small fades).
  Duration get fast => reduce ? Duration.zero : _fast;

  /// Standard transitions (sheets, switches, list entrances).
  Duration get medium => reduce ? Duration.zero : _medium;

  /// Emphasis transitions (hero-like, larger reveals).
  Duration get slow => reduce ? Duration.zero : _slow;

  /// Entrance easing; linear when motion is reduced.
  Curve get enter => reduce ? Curves.linear : Curves.easeOutCubic;

  /// Exit easing; linear when motion is reduced.
  Curve get exit => reduce ? Curves.linear : Curves.easeIn;
}

extension AppMotionX on BuildContext {
  /// Motion tokens for this context, respecting OS reduce-motion.
  AppMotion get motion => AppMotion.of(this);
}
