import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xff818181),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 18.0,
      ),
    ),
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xff818181)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.deepPurple
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(double.maxFinite, 50.0),
        ),
        elevation: MaterialStateProperty.all(
          0.0,
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
    cardTheme: const CardTheme(
      color: Color(0xff818181),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(color: Colors.white),
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
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEDF2F7)),
        borderRadius: BorderRadius.zero,
      ),
      labelStyle:  TextStyle(color: Colors.white),
      // constraints: BoxConstraints(maxHeight: 50.0),
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
    listTileTheme: const ListTileThemeData(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Color(0xff818181))
        ),
        iconColor: Colors.black,
        textColor: Colors.black,
        tileColor: Colors.white
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(
        color: Colors.white,
      ),
    )
);


//Light theme
ThemeData lightTheme = ThemeData(
 iconTheme: const IconThemeData(
  color: Color(0xff818181),
 ),
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.deepPurple,
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
      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0
        ),
      ),
      fixedSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 50.0),
      ),
      elevation: MaterialStateProperty.all(
       0.0,
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
    cardTheme: const CardTheme(
        color: Colors.deepPurple
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
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFEDF2F7)),
      borderRadius: BorderRadius.zero,
    ),
    labelStyle:  TextStyle(color: Color(0xff390069)),
    // constraints: BoxConstraints(maxHeight: 50.0),
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
  listTileTheme: const ListTileThemeData(
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Color(0xff818181))
    ),
    iconColor: Colors.deepPurple,
    textColor: Colors.deepPurple,
    tileColor: Colors.white
  ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(
        color: Colors.deepPurple,
      ),

    )
);
