import 'package:flutter/material.dart';

class OpacityTransition extends StatefulWidget {
  const OpacityTransition({
    Key? key,
    required this.child,
    required this.animation,
  }) : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  State<OpacityTransition> createState() => _OpacityTransitionState();
}

class _OpacityTransitionState extends State<OpacityTransition> {
  final sizeAnimation = Tween<double>(begin: 0, end: 200);
  final opacityAnimation = Tween<double>(begin: 0.1, end: 1);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: widget.child,
      animation: widget.animation,
      builder: (context, child) => Opacity(
        opacity: opacityAnimation.evaluate(widget.animation),
        child: SizedBox(
          child: child,
          width: 200, //sizeAnimation.evaluate(widget.animation),
          height: 200, //sizeAnimation.evaluate(widget.animation),
        ),
      ),
    );
  }
}
