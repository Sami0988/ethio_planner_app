import 'package:flutter/material.dart';
import '../constants/app_breakpoints.dart';

enum ScreenTier { compact, medium, expanded, large }

class ResponsiveLayout extends StatelessWidget {
  final Widget compact;
  final Widget? medium;
  final Widget? expanded;
  final Widget? large;

  const ResponsiveLayout({
    super.key,
    required this.compact,
    this.medium,
    this.expanded,
    this.large,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final tier = _getTier(width);

        return switch (tier) {
          ScreenTier.large => large ?? expanded ?? medium ?? compact,
          ScreenTier.expanded => expanded ?? medium ?? compact,
          ScreenTier.medium => medium ?? compact,
          ScreenTier.compact => compact,
        };
      },
    );
  }

  static ScreenTier getTier(double width) => _getTier(width);

  static ScreenTier _getTier(double width) {
    if (width >= AppBreakpoints.large) return ScreenTier.large;
    if (width >= AppBreakpoints.expanded) return ScreenTier.expanded;
    if (width >= AppBreakpoints.medium) return ScreenTier.medium;
    return ScreenTier.compact;
  }
}
