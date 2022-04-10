import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/commons/notifications/snack_bars.dart';
import 'package:flutter_tests_ui/screens/bezier_curves/bezier_curves.dart';
import 'package:flutter_tests_ui/screens/blend_image/blend_image_screen.dart';
import 'package:flutter_tests_ui/screens/container/container_screen.dart';
import 'package:flutter_tests_ui/screens/dark_mode/dark_mode_screen.dart';
import 'package:flutter_tests_ui/screens/glass_effect/glass_screen.dart';
import 'package:flutter_tests_ui/screens/green_lines_animation/green_lines_screen.dart';
import 'package:flutter_tests_ui/screens/neumorphism/neumorphism_screen.dart';
import 'package:flutter_tests_ui/screens/simple_animation/animated_logo.dart';
import 'package:flutter_tests_ui/screens/test_cupertino_switch/test_cupertino_switch.dart';
import 'package:flutter_tests_ui/screens/test_input_formatters/test_input_formatters_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tests_ui/managers/navigation_manager.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'routes/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState(){
    super.initState();
    AppSnackBars.initContext(context);
  }

  @override
  Widget build(BuildContext context) => Consumer<NavigationManager>(
        builder: (context, manager, child) => PageView(
          controller: manager.pageController,
          children: const [
            BezierCurvesScreen(),
            GlassmorphismScreen(),
            NeumorphismScreen(),
            GreenLinesScreen(),
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
