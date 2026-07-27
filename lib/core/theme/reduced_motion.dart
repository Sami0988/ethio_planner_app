import 'package:flutter/material.dart';

/// Utility to check if reduced motion is enabled and provide appropriate durations.
class ReducedMotion {
  /// Returns true if the user has enabled reduced motion in system settings.
  static bool isEnabled(BuildContext context) {
    return MediaQuery.of(context).disableAnimations;
  }

  /// Returns a Duration of zero if reduced motion is enabled, otherwise the normal duration.
  static Duration duration(BuildContext context, Duration normal) {
    return isEnabled(context) ? Duration.zero : normal;
  }

  /// Returns a Duration of zero if reduced motion is enabled, otherwise 300ms.
  static Duration defaultDuration(BuildContext context) {
    return duration(context, const Duration(milliseconds: 300));
  }

  /// Returns a Duration of zero if reduced motion is enabled, otherwise 200ms.
  static Duration fastDuration(BuildContext context) {
    return duration(context, const Duration(milliseconds: 200));
  }

  /// Returns 0.0 if reduced motion is enabled, otherwise the normal curve value.
  static double animatedOpacity(BuildContext context, double target) {
    return isEnabled(context) ? target : target;
  }

  /// Returns the target value directly if reduced motion is enabled.
  static T animatedValue<T>(BuildContext context, T target) {
    return target;
  }
}
