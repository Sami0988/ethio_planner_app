import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Accessibility constants and helpers for the app.
class AccessibilityHelper {
  AccessibilityHelper._();

  /// Minimum touch target size (WCAG 2.1 AA).
  static const double minTouchTarget = 48.0;

  /// Minimum contrast ratio for normal text (WCAG AA).
  static const double minContrastRatio = 4.5;

  /// Minimum contrast ratio for large text (WCAG AA).
  static const double minLargeTextContrastRatio = 3.0;

  /// Wraps a widget with proper semantic labeling for screen readers.
  static Widget wrapWithSemantics({
    required Widget child,
    required String label,
    String? hint,
    bool isButton = false,
    bool isFocused = false,
    VoidCallback? onLongPress,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      button: isButton,
      focused: isFocused,
      onLongPress: onLongPress,
      child: child,
    );
  }

  /// Creates a properly sized touch target for interactive elements.
  static Widget ensureTouchTarget({
    required Widget child,
    double minimumSize = minTouchTarget,
    VoidCallback? onTap,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minimumSize,
        minHeight: minimumSize,
      ),
      child: onTap != null
          ? GestureDetector(onTap: onTap, child: child)
          : child,
    );
  }

  /// Announces a message to screen readers.
  static void announce(BuildContext context, String message) {
    SemanticsService.sendAnnouncement(
      View.of(context),
      message,
      TextDirection.ltr,
    );
  }

  /// Announces a tooltip-style message to screen readers.
  static void tooltip(BuildContext context, String message) {
    SemanticsService.tooltip(message);
  }
}

/// Extension on Widget for easy accessibility wrapping.
extension AccessibilityExtension on Widget {
  /// Wraps the widget with semantic labeling.
  Widget withSemantics({
    required String label,
    String? hint,
    bool isButton = false,
  }) {
    return Semantics(label: label, hint: hint, button: isButton, child: this);
  }
}
