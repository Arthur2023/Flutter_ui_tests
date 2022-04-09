import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests_ui/managers/app_theme_manager.dart';
import 'package:flutter_tests_ui/managers/navigation_manager.dart';
import 'package:flutter_tests_ui/routes/routes.dart';
import 'package:flutter_tests_ui/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

import 'managers/app_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = ((details) => Material(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                details.exception.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ));
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider<AppThemeManager>(
      create: (_) => AppThemeManager(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppManager()),
          ChangeNotifierProvider(create: (_) => NavigationManager()),
        ],
        child: Consumer<AppThemeManager>(
          builder: (context, manager, child) => MaterialApp(
            title: 'Flutter - Test screens',
            routes: appRoutes,
            theme: manager.appThemeData,
            initialRoute: MainScreen.route,
          ),
        ),
      );
}
