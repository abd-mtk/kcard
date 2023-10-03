import 'package:flutter/material.dart';

ThemeData darkYellowTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  hintColor: Colors.yellow,
  scaffoldBackgroundColor: Colors.black,
  cardColor: Colors.amberAccent,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white70, fontFamily: 'Aref_Ruqaa_Ink'),
    bodyMedium: TextStyle(color: Colors.white70, fontFamily: 'Aref_Ruqaa_Ink'),
    displayLarge: TextStyle(
        color: Colors.white, fontSize: 24, fontFamily: 'Aref_Ruqaa_Ink'),
    displayMedium: TextStyle(
        color: Colors.white, fontSize: 20, fontFamily: 'Aref_Ruqaa_Ink'),
    displaySmall: TextStyle(
        color: Colors.white, fontSize: 16, fontFamily: 'Aref_Ruqaa_Ink'),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.amber,
    foregroundColor: Colors.black,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.amberAccent,
    textTheme: ButtonTextTheme.primary,
  ),
);
