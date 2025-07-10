import 'package:flutter/material.dart';

extension ContextResponsiveExtension on BuildContext {
  T adaptive<T>(T mobile, T desktop, [T? tablet]) {
    final width = MediaQuery.of(this).size.width;

    if (width < 600) {
      return mobile;
    } else if (width >= 600 && width < 950) {
      return tablet ?? desktop;
    } else {
      return desktop;
    }
  }
}
