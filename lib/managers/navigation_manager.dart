import 'package:flutter/material.dart';

class NavigationManager extends ChangeNotifier{
  late PageController pageController;

  NavigationManager(){
    pageController = PageController();
  }

  void changePage({required double newIndex}){
    pageController.jumpTo(newIndex);
    notifyListeners();
  }
}