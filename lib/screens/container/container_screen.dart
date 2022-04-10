import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/widgets/low_opacitity_badge/low_opacity_badge.dart';
import 'package:provider/provider.dart';

import '../../managers/app_manager.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Consumer<AppManager>(builder: (context, manager, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                shadowContainer(manager),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      updateColor(manager),
                      updateValues(
                        'Offset 1',
                        () => manager.updateOffset(1, -1),
                        () => manager.updateOffset(1, 1),
                      ),
                      updateValues(
                        'Offset 2',
                        () => manager.updateOffset(2, -1),
                        () => manager.updateOffset(2, 1),
                      ),
                      updateValues(
                        'Blur radius',
                        () => manager.updateBlurRadius(-1),
                        () => manager.updateBlurRadius(1),
                      ),
                      updateValues(
                        'Spread radius',
                        () => manager.updateSpreadRadius(-1),
                        () => manager.updateSpreadRadius(1),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      );

  Container shadowContainer(AppManager manager) => Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.deepPurple,
              ],
            ),
            color: Colors.red,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                blurRadius: manager.blurRadius,
                spreadRadius: manager.spreadRadius,
                color: manager.colorValue,
                offset: Offset(manager.offset1, manager.offset2),
              ),
            ]),
      );

  Row updateColor(AppManager manager) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Color'),
          LowOpacityBadge(
            title: 'Change',
            function: () => manager.updateColor(),
          ),
        ],
      );

  Widget updateValues(
    String text,
    VoidCallback decrease,
    VoidCallback addition,
  ) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Row(
              children: [
                LowOpacityBadge(
                  width: 50,
                  title: '-',
                  function: decrease,
                ),
                const SizedBox(width: 5),
                LowOpacityBadge(
                  width: 50,
                  title: '+',
                  function: addition,
                ),
              ],
            ),
          ],
        ),
      );
}
