import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.purple,
  hintColor: Colors.blueGrey[800],
  scaffoldBackgroundColor: Colors.blueGrey[800],
  cardColor: Colors.blueGrey[800],
  fontFamily: 'Aref_Ruqaa_Ink',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
        fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
    labelLarge: TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.purple[700],
    foregroundColor: Colors.white,
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
    toolbarTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.purple[700],
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.teal,
    weight: 12,
    shadows: [
      Shadow(
        color: Colors.black,
        blurRadius: 2,
        offset: Offset(1, 1),
      ),
    ],
    size: 24,
  ),
);
