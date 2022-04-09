import 'package:flutter/material.dart';

class GrowTransition extends StatefulWidget {
  const GrowTransition({
    Key? key,
    required this.child,
    required this.animation,
  }) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  State<GrowTransition> createState() => _GrowTransitionState();
}

class _GrowTransitionState extends State<GrowTransition> {
  final sizeAnimation = Tween<double>(begin: 0, end: 200);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: widget.child,
      animation: widget.animation,
      builder: (context, child) {
        return Center(
          child: SizedBox(
            child: child,
            width: sizeAnimation.evaluate(widget.animation),
            height: sizeAnimation.evaluate(widget.animation),
          ),
        );
      },
    );
  }
}
