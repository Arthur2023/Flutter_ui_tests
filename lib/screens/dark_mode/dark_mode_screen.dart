import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/commons/commons_export/layout_export.dart';
import 'package:flutter_tests_ui/screens/dark_mode/dark_mode_functions.dart';

class DarkModeScreen extends StatelessWidget with DarkModeFunctions {
  const DarkModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: InkWell(
            child: const Text(
              'Change theme',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: (){
              Theme.of(context).brightness == lightTheme.brightness
                  ? onDarkTap(context)
                  : onLightTap(context);
            },
          ),
        ),
      );
}
