import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/screens/simple_animation/components/grow_transition.dart';
import 'package:flutter_tests_ui/screens/simple_animation/components/opacity_transition.dart';

class SimpleLogoScreen extends StatefulWidget {
  const SimpleLogoScreen({Key? key}) : super(key: key);

  @override
  State<SimpleLogoScreen> createState() => _SimpleLogoScreenState();
}

class _SimpleLogoScreenState extends State<SimpleLogoScreen> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      curve: Curves.easeIn,
      parent: animationController,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            animationController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            animationController.forward();
          }
        },
      );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OpacityTransition(
            animation: animation,
            child: GrowTransition(
              animation: animation,
              child: const FlutterLogo(),
            ),
          ),
          Container(color: Colors.red),
        ],
      );
}
