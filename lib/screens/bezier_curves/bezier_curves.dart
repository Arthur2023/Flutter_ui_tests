import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/widgets/clip_shadow_path/clip_shadow_path.dart';
import 'package:flutter_tests_ui/widgets/clippers/big_clipper.dart';
import 'package:flutter_tests_ui/widgets/clippers/small_clipper.dart';

class BezierCurvesScreen extends StatelessWidget {
  static const String route = 'routes/bezier_curves';

  const BezierCurvesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.purple[800],
        body: Stack(
          children: [
            ClipShadowPath(
              key: const Key('big_clipper'),
              clipper: BigClipper(),
              shadow: const BoxShadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 4,
                spreadRadius: 8,
              ),
              child: Container(color: Colors.purple),
            ),
            ClipShadowPath(
              key: const Key('small_clipper'),
              clipper: SmallClipper(),
              shadow: const BoxShadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 4,
                spreadRadius: 8,
              ),
              child: Container(color: Colors.purple[800]),
            ),
            const Center(
              child: Text(
                'Bezier curves',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      );
}
