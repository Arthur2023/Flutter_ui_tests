import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TestCupertinoSwitch extends StatefulWidget {
  const TestCupertinoSwitch({Key? key}) : super(key: key);

  @override
  State<TestCupertinoSwitch> createState() => _TestCupertinoSwitchState();
}

class _TestCupertinoSwitchState extends State<TestCupertinoSwitch> {
  bool value = false;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: Colors.black,
        navigationBar: CupertinoNavigationBar(
          middle: const Text(
            'Cupertino Switch',
            style: TextStyle(color: CupertinoColors.inactiveGray),
          ),
          backgroundColor: CupertinoColors.darkBackgroundGray,
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {},
            color: CupertinoColors.inactiveGray,
          ),
        ),
        child: Material(
          child: Container(
            margin: const EdgeInsets.only(
              top: 120,
              left: 50,
              right: 20,
            ),
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Switch value'),
                  CupertinoSwitch(
                    value: value,
                    onChanged: (newValue) {
                      value = newValue;
                      setState(() {});
                    },
                    activeColor: CupertinoColors.activeBlue,
                    trackColor: CupertinoColors.inactiveGray,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
