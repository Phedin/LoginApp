import 'package:flutter/material.dart';
import '../presentation/frame_one_screen/frame_one_screen.dart';

class AppRoutes {
  static const String frameOneScreen = '/frame_one_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        frameOneScreen: FrameOneScreen.builder,
        initialRoute: FrameOneScreen.builder
      };
}
