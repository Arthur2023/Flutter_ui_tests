import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/managers/app_manager.dart';
import 'package:flutter_tests_ui/widgets/low_opacitity_badge/low_opacity_badge.dart';
import 'package:provider/provider.dart';

import '../../commons/paths/images.dart';

class BlendImageScreen extends StatelessWidget {
  const BlendImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Consumer<AppManager>(builder: (context, manager, child) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  neon,
                  fit: BoxFit.cover,
                  color: manager.colorValue,
                  colorBlendMode: manager.currentBlendModeValue,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LowOpacityBadge(
                      width: 200,
                      title: manager.currentBlendModeName,
                      function: () => manager.updateCurrentBlendMode(),
                    ),
                    const SizedBox(height: 15),
                    LowOpacityBadge(
                      width: 200,
                      title: manager.colorName,
                      function: () => manager.updateColor(),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      );
}
