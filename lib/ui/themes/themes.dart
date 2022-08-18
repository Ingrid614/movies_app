import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepPurple,
  fontFamily: GoogleFonts.poppins().fontFamily,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16.0),
      ),
      fixedSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 50.0),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
      fixedSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 50.0),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      side: MaterialStateProperty.all(
        const BorderSide(color: Colors.deepPurple),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16.0),
      ),
      fixedSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 50.0),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(),
  ),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.bold,
      // color: Colors.black,
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);
//
ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.deepPurple,
      fontSize: 18.0,
    ),
  ),
  brightness: Brightness.light,
  primarySwatch: Colors.deepPurple,
  fontFamily: GoogleFonts.poppins().fontFamily,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16.0),
      ),
      fixedSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 50.0),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 50.0),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      side: MaterialStateProperty.all(
        const BorderSide(color: Colors.deepPurple),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16.0),
      ),
      fixedSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 50.0),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFEDF2F7)),
      borderRadius: BorderRadius.zero,
    ),
    constraints: BoxConstraints(maxHeight: 50.0),
  ),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);
