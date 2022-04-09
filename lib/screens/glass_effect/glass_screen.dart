import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/widgets/glassmorphism/glassmorphism.dart';

import '../../commons/commons_export/layout_export.dart';

class GlassmorphismScreen extends StatelessWidget {
  const GlassmorphismScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isBlur = ValueNotifier<bool>(true);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Image.asset(
            neon,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Center(
            child: GestureDetector(
              onTap: () => _isBlur.value = !_isBlur.value,
              child: ValueListenableBuilder(
                valueListenable: _isBlur,
                builder: (context, bool isBlur, child) => GlassMorphism(
                  blur: isBlur ? 20 : 0,
                  opacity: 0.2,
                  child: const SizedBox(
                    width: 320,
                    height: 210,
                    child: Center(
                      child: Text(
                        'Glassmorphism',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
