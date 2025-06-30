import 'package:flutter/material.dart';

extension ContextResponsiveExtension on BuildContext {
  T adaptive<T>(T mobile, T desktop, {T? tablet}) {
    final width = MediaQuery.of(this).size.width;
    if (width < 600) return mobile;
    if (width >= 950 && tablet != null) return tablet;
    return desktop;
  }
}

