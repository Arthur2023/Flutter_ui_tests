import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/commons/notifications/snack_bars.dart';

class AppManager extends ChangeNotifier{
  int currentBlendModeIndex = 0;
  int currentBlendColorIndex = 0;

  double offset1 = 25;
  double offset2 = 20;
  double blurRadius = 10;
  double spreadRadius = 5;

  String get currentBlendModeName => blendModes[currentBlendModeIndex].keys.first;
  BlendMode get currentBlendModeValue => blendModes[currentBlendModeIndex].values.first;

  String get colorName => colors[currentBlendColorIndex].keys.first;
  Color get colorValue => colors[currentBlendColorIndex].values.first;

  static const List<Map<String, BlendMode>> blendModes = [
    {'Darken': BlendMode.darken},
    {'Color Burn': BlendMode.colorBurn},
    {'Color Dodge': BlendMode.colorDodge},
    {'Color': BlendMode.color},
    {'Multiply': BlendMode.multiply},
    {'Hard Light': BlendMode.hardLight},
    {'Clear': BlendMode.clear},
    {'Dst': BlendMode.dst},
    {'Screen': BlendMode.screen},
    {'Hue': BlendMode.hue},
    {'Modulate': BlendMode.modulate},
    {'Plus': BlendMode.plus},
    {'Overlay': BlendMode.overlay},
    {'Saturation': BlendMode.saturation},
    {'Xor': BlendMode.xor},
    {'Soft Light': BlendMode.softLight},
  ];

  static List<Map<String, Color>> colors = [
    {'Black45': Colors.black45},
    {'Black12': Colors.black12},
    {'Gray 500': Colors.grey[500]!},
    {'Red': Colors.red},
    {'Blue': Colors.blue},
    {'Green': Colors.green},
    {'Amber': Colors.amber},
    {'Black': Colors.black},
    {'White': Colors.white},
    {'Pink': Colors.pink},
    {'Deep purple': Colors.deepPurple},
    {'Orange': Colors.orange},
    {'Teal': Colors.teal},
    {'Indigo': Colors.indigo},
  ];

  void updateCurrentBlendMode(){
    currentBlendModeIndex == (blendModes.length - 1)
        ? currentBlendModeIndex = 0
        : ++currentBlendModeIndex;
    notifyListeners();
  }

  void updateColor(){
    currentBlendColorIndex == (colors.length - 1)
        ? currentBlendColorIndex = 0
        : ++currentBlendColorIndex;
    notifyListeners();
  }

  void updateOffset(int offset, double addValue){
    assert(offset > 0 && offset < 3);
    offset == 1 ? offset1 += addValue : offset2 += addValue;
    notifyListeners();
  }

  void updateBlurRadius(double addValue){
      addValue < 0 && blurRadius == 0
          ? AppSnackBars.minValueSnackBar()
          : blurRadius += addValue;
      notifyListeners();
  }

  void updateSpreadRadius(double addValue){
      addValue < 0 && spreadRadius == 0
          ? AppSnackBars.minValueSnackBar()
          : spreadRadius += addValue;
      notifyListeners();
  }
}