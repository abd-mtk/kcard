import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.green[900],
  hintColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  fontFamily: 'Aref_Ruqaa_Ink',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
    labelLarge: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green[900],
    foregroundColor: Colors.black,
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
    toolbarTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green[900],
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.blue[900],
    weight: 12,
    shadows: const [
      Shadow(
        color: Colors.black,
        blurRadius: 2,
        offset: Offset(1, 1),
      ),
    ],
    size: 24,
  ),
);
