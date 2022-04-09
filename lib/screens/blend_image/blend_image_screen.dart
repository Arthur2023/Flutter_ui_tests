import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/managers/app_manager.dart';
import 'package:provider/provider.dart';

import '../../commons/paths/images.dart';

class BlendImageScreen extends StatelessWidget {
  const BlendImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Consumer<AppManager>(
          builder: (context, manager, child) {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    neon,
                    fit: BoxFit.cover,
                    color: manager.currentBlendColorValue,
                    colorBlendMode: manager.currentBlendModeValue,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => manager.updateCurrentBlendMode(),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.black45.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              manager.currentBlendModeName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () => manager.updateBlendColor(),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.black45.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              manager.currentBlendColorName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      );
}
