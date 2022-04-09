import 'package:flutter/material.dart';

class AppManager extends ChangeNotifier{
  int currentBlendModeIndex = 0;
  int currentBlendColorIndex = 0;

  String get currentBlendModeName => blendModes[currentBlendModeIndex].keys.first;
  BlendMode get currentBlendModeValue => blendModes[currentBlendModeIndex].values.first;

  String get currentBlendColorName => blendColors[currentBlendColorIndex].keys.first;
  Color get currentBlendColorValue => blendColors[currentBlendColorIndex].values.first;

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

  static const List<Map<String, Color>> blendColors = [
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

  void updateBlendColor(){
    currentBlendColorIndex == (blendColors.length - 1)
        ? currentBlendColorIndex = 0
        : ++currentBlendColorIndex;
    notifyListeners();
  }
}