import 'package:flutter/material.dart';

class AppSnackBars{
  static late BuildContext context;

  static void initContext(BuildContext newContext){
    context = newContext;
  }

  static void minValueSnackBar() {
    final snack = standardSnackBar('Valor mínimo atingido!');
    showSnackBar(snack);
  }

  static void maxValueSnackBar() {
    final snack = standardSnackBar('Valor máximo atingido!');
    showSnackBar(snack);
  }

  static SnackBar standardSnackBar(String text){
    return SnackBar(
      content: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
      ),
      backgroundColor: Colors.black12.withOpacity(0.35),
    );
  }

  static void showSnackBar(SnackBar snackBar){
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}