import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Gradient decorations
  static BoxDecoration get gradientPinkToPrimaryContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [appTheme.pink500, theme.colorScheme.primaryContainer],
        ),
      );
}

class BorderRadiusStyle {}
