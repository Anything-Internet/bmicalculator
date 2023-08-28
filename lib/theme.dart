import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData dark = _darkTheme();
  static ThemeData light = _lightTheme();
}

ThemeData _darkTheme() {
  const Color myRed = Color(0xFFEB1555);
  const Color myDarkBlue = Color(0xFF0A0E21);
  const Color myLightBlue = Color(0xFF1D1E33);
  const Color myGrey = Color(0xFF8D8E98);
  const Color myGreen = Color(0xFF24D876);
  const Color myYellow = Color(0xFFFFDD00);
  const Color myWhite = Color(0xFFFFFFFF);

  return ThemeData.dark().copyWith(
    primaryColor: myDarkBlue,
    scaffoldBackgroundColor: myDarkBlue,
    hintColor: myRed,
    cardColor: myGrey,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: myYellow,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: myLightBlue,
      foregroundColor: myRed,
      elevation: 0,
      centerTitle: true,
    ),
    dividerTheme: const DividerThemeData(
      color: myGrey,
      thickness: 1,
      space: 40,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 5,
      ),
      hintStyle: const TextStyle(
        color: myGrey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: myRed,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: myRed,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: myWhite,
          width: 1,
        ),
      ),
    ),


    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: myRed,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: myLightBlue,
      selectedItemColor: myRed,
      unselectedItemColor: myGrey,
    ),
  );
}

ThemeData _lightTheme() {
  const Color myRed = Color(0xFFEB1555);
  const Color myDarkBlue = Color(0xFF0A0E21);
  const Color myLightBlue = Color(0xFF1D1E33);
  const Color myGrey = Color(0xFF8D8E98);
  const Color myGreen = Color(0xFF24D876);
  const Color myYellow = Color(0xFFFFDD00);
  const Color myWhite = Color(0xFFFFFFFF);

  return ThemeData.light().copyWith(
    primaryColor: myDarkBlue,
    scaffoldBackgroundColor: myWhite,
    hintColor: myRed,
    cardColor: myGrey,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: myDarkBlue,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: myLightBlue,
      foregroundColor: myRed,
      elevation: 0,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: myRed,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: myLightBlue,
      selectedItemColor: myRed,
      unselectedItemColor: myGrey,
    ),
  );
}
