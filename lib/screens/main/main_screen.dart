import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/screens/bezier_curves/bezier_curves.dart';
import 'package:flutter_tests_ui/screens/blend_image/blend_image_screen.dart';
import 'package:flutter_tests_ui/screens/container/container_screen.dart';
import 'package:flutter_tests_ui/screens/dark_mode/dark_mode_screen.dart';
import 'package:flutter_tests_ui/screens/glass_effect/glass_screen.dart';
import 'package:flutter_tests_ui/screens/neumorphism/neumorphism_screen.dart';
import 'package:flutter_tests_ui/screens/simple_animation/animated_logo.dart';
import 'package:flutter_tests_ui/screens/test_cupertino_switch/test_cupertino_switch.dart';
import 'package:flutter_tests_ui/screens/test_input_formatters/test_input_formatters_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tests_ui/managers/navigation_manager.dart';

class MainScreen extends StatelessWidget {
  static const String route = 'routes/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<NavigationManager>(
        builder: (context, manager, child) => PageView(
          controller: manager.pageController,
          children: const [
            BezierCurvesScreen(),
            GlassmorphismScreen(),
            NeumorphismScreen(),
            DarkModeScreen(),
            TestCupertinoSwitch(),
            ContainerScreen(),
            TestInputFormattersScreen(),
            SimpleLogoScreen(),
            BlendImageScreen(),
          ],
        ),
      );
}
