import 'package:flutter/material.dart';

ThemeData lightGreenTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.lightGreen,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.lightGreenAccent,
  hintColor: Colors.black,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black87, fontFamily: 'Aref_Ruqaa_Ink'),
    bodyMedium: TextStyle(color: Colors.black87, fontFamily: 'Aref_Ruqaa_Ink'),
    displayLarge:
        TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'Aref_Ruqaa_Ink'),
    displayMedium:
        TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Aref_Ruqaa_Ink'),
    displaySmall:
        TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Aref_Ruqaa_Ink'),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.lightGreen,
    foregroundColor: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.lightGreenAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
);
