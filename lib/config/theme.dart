import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final theme = ThemeData();
  return theme.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    appBarTheme: AppBarTheme(backgroundColor: theme.colorScheme.inversePrimary),
  );
}
