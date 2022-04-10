import 'package:flutter/material.dart';

class GreenLinesScreen extends StatefulWidget {
  const GreenLinesScreen({Key? key}) : super(key: key);

  @override
  State<GreenLinesScreen> createState() => _GreenLinesScreenState();
}

class _GreenLinesScreenState extends State<GreenLinesScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> linesAnimation;

  late AnimationController animationController;
  late AnimationController linesAnimationController;

  Tween<double> sizeTransition = Tween<double>(end: 0, begin: 0);

  BoxDecoration get linesDecoration => BoxDecoration(
    image: null,
    color: Colors.green,
    gradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.8, 1],
      colors: [
        Colors.green,
        Colors.lightGreen,
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey[500]!,
        offset: const Offset(2, 2),
        blurRadius: 8,
        spreadRadius: 1,
      ),
      const BoxShadow(
        color: Colors.green,
        offset: Offset(-2, -2),
        blurRadius: 8,
        spreadRadius: 1,
      ),
    ],
  );

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    linesAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    animation = CurvedAnimation(
      curve: Curves.bounceIn,
      parent: animationController,
    );

    linesAnimation = CurvedAnimation(
      curve: Curves.easeIn,
      parent: linesAnimationController,
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      sizeTransition = Tween<double>(begin: 0, end: 1);
    });
  }

  void animateLines() async {
    linesAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 1500));
    linesAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final isElevated = ValueNotifier<bool>(true);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: linesAnimation,
                  builder: (context, animation) => Container(
                    width: 5,
                    height: sizeTransition.evaluate(linesAnimation) * (MediaQuery.of(context).size.height / 2),
                    decoration: linesDecoration,
                  ),
                ),
                AnimatedBuilder(
                  animation: linesAnimation,
                  builder: (context, animation) => Container(
                    width: 5,
                    height: sizeTransition.evaluate(linesAnimation) * (MediaQuery.of(context).size.height / 2),
                    decoration: linesDecoration,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: linesAnimation,
                  builder: (context, animation) => Container(
                    height: 5,
                    width: sizeTransition.evaluate(linesAnimation) * (MediaQuery.of(context).size.width / 2),
                    decoration: linesDecoration,
                  ),
                ),
                AnimatedBuilder(
                  animation: linesAnimation,
                  builder: (context, animation) => Container(
                    height: 5,
                    width: sizeTransition.evaluate(linesAnimation) * (MediaQuery.of(context).size.width / 2),
                    decoration: linesDecoration,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    isElevated.value = false;
                    animationController.forward();
                    animateLines();
                    await Future.delayed(const Duration(milliseconds: 300));
                    animationController.reverse();
                    isElevated.value = true;
                  },
                  child: ValueListenableBuilder(
                    valueListenable: isElevated,
                    builder: (context, bool elevated, child) => AnimatedContainer(
                      width: 200,
                      height: 200,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: elevated
                            ? [
                                BoxShadow(
                                  color: Colors.grey[500]!,
                                  offset: const Offset(4, 4),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4, -4),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                ),
                              ]
                            : null,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.ac_unit_sharp,
                          size: 50,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
