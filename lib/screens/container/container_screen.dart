import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
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
                        blurRadius: 10,
                        spreadRadius: 5,
                        color: Colors.black45,
                        offset: Offset(25, 50),
                      ),
                    ]),
              ),
              const Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  'Box Shadow',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
