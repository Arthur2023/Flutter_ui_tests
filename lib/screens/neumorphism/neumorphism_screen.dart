import 'package:flutter/material.dart';

class NeumorphismScreen extends StatefulWidget {
  const NeumorphismScreen({Key? key}) : super(key: key);

  @override
  State<NeumorphismScreen> createState() => _NeumorphismScreenState();
}

class _NeumorphismScreenState extends State<NeumorphismScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animationController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isElevated = ValueNotifier<bool>(true);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                isElevated.value = false;
                animationController.forward();
                await Future.delayed(const Duration(milliseconds: 800));
                animationController.reverse();
                isElevated.value = true;
              },
              child: ValueListenableBuilder(
                valueListenable: isElevated,
                builder: (context, bool elevated, child) => AnimatedContainer(
                  width: 200,
                  height: 200,
                  duration: const Duration(milliseconds: 200),
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
                  child: Center(
                    child: Icon(
                      Icons.ac_unit_sharp,
                      size: 50,
                      color: Colors.white.withOpacity(animationController.value),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Neumorphism',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
