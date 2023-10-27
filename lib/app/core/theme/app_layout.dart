import 'package:flutter/material.dart';

abstract class Breakpoints {
  /// Device max width
  static const double mobile = 600;
  static const double tablet = 1000;
  static const double desktop = 1190;

  /// BottomSheet max width
  static const double bottomSheet = 600;
}

abstract class SpaceData {
  static const double px4 = 4.0;
  static const double px8 = 8.0;
  static const double px12 = 12.0;
  static const double px16 = 16.0;
  static const double px20 = 20.0;
}

extension LayoutExt on BuildContext {
  /// Screen size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Responsive layout
  T layout<T>(
    T base, {
    T? mobile,
    T? tablet,
    T? desktop,
  }) {
    if (screenSize.width < Breakpoints.mobile) {
      return mobile ?? base;
    } else if (screenSize.width < Breakpoints.tablet) {
      return tablet ?? base;
    } else {
      return desktop ?? base;
    }
  }
}
