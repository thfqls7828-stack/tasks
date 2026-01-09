import 'package:flutter/material.dart';

class Themes {
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarThemeData(backgroundColor: Colors.white70),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        brightness: Brightness.light,
      ),
      dividerColor: Colors.black,
      highlightColor: Colors.orange,
      scaffoldBackgroundColor: Colors.grey[350],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarThemeData(backgroundColor: Colors.grey[600]),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        brightness: Brightness.dark,
      ),
      dividerColor: Colors.black,
      highlightColor: Colors.indigo,
      scaffoldBackgroundColor: Colors.grey,
    );
  }
}
