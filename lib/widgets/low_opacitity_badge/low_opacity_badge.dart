import 'package:flutter/material.dart';

class LowOpacityBadge extends StatelessWidget {
  final String title;
  final double? width;
  final Function function;

  const LowOpacityBadge({
    Key? key,
    this.width,
    required this.title,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.black45.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
