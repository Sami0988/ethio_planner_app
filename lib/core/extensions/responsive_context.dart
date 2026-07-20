import 'package:flutter/material.dart';
import '../constants/app_breakpoints.dart';
import '../widgets/responsive_layout.dart';

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  ScreenTier get screenTier =>
      ResponsiveLayout.getTier(screenWidth);

  bool get isCompact => screenWidth < AppBreakpoints.compact;
  bool get isMedium =>
      screenWidth >= AppBreakpoints.compact &&
      screenWidth < AppBreakpoints.expanded;
  bool get isExpanded =>
      screenWidth >= AppBreakpoints.expanded &&
      screenWidth < AppBreakpoints.large;
  bool get isLarge => screenWidth >= AppBreakpoints.large;

  bool get isMobile => screenWidth < AppBreakpoints.medium;
  bool get isTablet =>
      screenWidth >= AppBreakpoints.medium &&
      screenWidth < AppBreakpoints.large;
  bool get isDesktop => screenWidth >= AppBreakpoints.large;
}
