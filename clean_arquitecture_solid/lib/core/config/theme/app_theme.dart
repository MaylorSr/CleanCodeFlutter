import 'package:flutter/material.dart';

class AppTheme {
  final bool darkMode;

  AppTheme({this.darkMode = false});

  ThemeData getThemeData() => ThemeData(
        useMaterial3: true,
        brightness: darkMode ? Brightness.dark : Brightness.light,
      );

  AppTheme copyWith({bool? darkMode}) => AppTheme(
        darkMode: darkMode ?? this.darkMode,
      );
      
}
