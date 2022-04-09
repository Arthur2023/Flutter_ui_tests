import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      iconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        accentColor: Colors.grey[300],
        brightness: Brightness.light,
        errorColor: Colors.red[700],
      ).copyWith(secondary: Colors.black),
    );

ThemeData get darkTheme => ThemeData(
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      iconTheme: const IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        accentColor: Colors.black12,
        brightness: Brightness.dark,
        errorColor: Colors.red[500]
      ).copyWith(secondary: Colors.white),
    );
