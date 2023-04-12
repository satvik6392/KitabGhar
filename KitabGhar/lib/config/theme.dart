import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: texttheme(),
  );
}

TextTheme texttheme() {
  return const TextTheme(
    displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal),
    titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal),
  );
}
