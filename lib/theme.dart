import 'package:flutter/material.dart';

const Color myRed = Color(0xFFEB1555);
const Color myDarkBlue = Color(0xFF000D31);
const Color myLightBlue = Color(0xFF252536);
const Color myGrey = Color(0xFF8D8E98);
const Color myGreen = Color(0xFF24D876);
const Color myYellow = Color(0xFFFFDD00);
const Color myWhite = Color(0xFFFFFFFF);

class _Dark {
  static const fgText = myWhite;
  static const fgTextDisabled = myGrey;
  static const fgTextHint = myYellow;
  static const fgTextLink = myRed;
  static const fgTextLinkHover = myRed;
  static const fgTextLinkVisited = myRed;
  static const fgTextLinkDisabled = myGrey;
  static const fgTextSelected = myRed;
  static const fgTextError = myRed;
  static const fgTextSuccess = myRed;
  static const fgTextWarning = myRed;
  static const fgTextInfo = myRed;
  static const fgTextDebug = myRed;
  static const fgTextInverse = myRed;
  static const fgTextInverseDisabled = myRed;
  static const fgTextInverseHint = myRed;
  static const fgTextInverseLink = myRed;
  static const fgTextInverseLinkHover = myRed;
  static const fgTextInverseLinkVisited = myRed;
  static const fgTextInverseLinkDisabled = myRed;
  static const fgTextInverseSelected = myRed;
  static const fgTextInverseError = myRed;
  static const fgTextInverseSuccess = myRed;
  static const fgTextInverseWarning = myRed;
  static const fgTextInverseInfo = myRed;
  static const fgTextInverseDebug = myRed;
  static const fgTextPrimary = myRed;
  static const fgTextPrimaryDisabled = myRed;
  static const fgTextPrimaryHint = myRed;
  static const fgTextPrimaryLink = myRed;
  static const fgTextPrimaryLinkHover = myRed;
  static const fgTextPrimaryLinkVisited = myRed;
  static const fgTextPrimaryLinkDisabled = myRed;
  static const fgTextPrimarySelected = myRed;
  static const fgTextPrimaryError = myRed;
  static const fgTextPrimarySuccess = myRed;
  static const fgTextPrimaryWarning = myRed;
  static const fgTextPrimaryInfo = myRed;
  static const fgBorder = myRed;
  static const bgField = myDarkBlue;
  static const bgButton = myLightBlue;
  static const bgCard = myGrey;
  static const bgAppBar = myLightBlue;
  static const bgScaffold = myDarkBlue;
  static const bgBottomNav = myLightBlue;
  static const bgDialog = myLightBlue;
  static const bgSwitch = myRed;
  static const bgSwitchTrack = myRed;
  static const bgSwitchTrackOutline = myRed;
  static const bgSlider = myRed;
  static const bgSliderTrack = myRed;
  static const bgSliderTrackLeft = myRed;
  static const bgSliderTrackRight = myRed;
  static const bgSliderThumb = myRed;
  static const bgSliderValueIndicator = myRed;
  static const bgTooltip = myRed;
  static const bgBottomSheet = myRed;
  static const bgBottomSheetModal = myRed;
}



// baseTheme includes all the default values for ThemeData
// Fonts and spacing, borders, etc., are all set in baseTheme.
// Default colors are in baseTheme, but can be overridden
// in lightTheme and darkTheme.

ThemeData baseTheme = ThemeData(
  // colorScheme: ColorScheme.fromSeed(
  //   seedColor: Colors.blue,
  // ),

/*
  primaryColor: myRed,
  primaryColorDark: myDarkBlue,
  primaryColorLight: myLightBlue,

  canvasColor,
  cardColor,
  dialogBackgroundColor,
  disabledColor,
  dividerColor,
  focusColor,
  highlightColor,
  hintColor,
  hoverColor,
  indicatorColor,
  primaryColor,
  primaryColorDark,
  primaryColorLight,
  scaffoldBackgroundColor,
  secondaryHeaderColor,
  shadowColor,
  splashColor,
  unselectedWidgetColor
*/
  appBarTheme: const AppBarTheme(
    color: myLightBlue,
    foregroundColor: myRed,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: myLightBlue,
    selectedItemColor: myRed,
    unselectedItemColor: myGrey,
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: myRed,

  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(myRed),
      overlayColor: MaterialStateProperty.all<Color>(myRed.withOpacity(0.5)),
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(
          color: myRed,
          width: 1,
        ),
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    fillColor: myDarkBlue,
    filled: true,

    contentPadding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 5,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: myRed,
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        color: myGrey,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        style: BorderStyle.solid,
        width: 1,
        color: myRed,
      ),
    ),
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
    ),
  ),

  dividerTheme: const DividerThemeData(
    thickness: 2,
    color: myRed,
    space: 20,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: myRed,
  ),

  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(myRed),
    trackColor: MaterialStateProperty.all<Color>(myRed.withOpacity(0.0)),
    trackOutlineColor: MaterialStateProperty.all<Color>(myRed.withOpacity(0.5)),
  ),
);

////////////////////////////////////////////////

// only modify the colors here.  Everything else is set in baseTheme.
ThemeData lightTheme = baseTheme.copyWith(
  primaryColor: myDarkBlue,
  scaffoldBackgroundColor: myWhite,
  hintColor: myRed,
  cardColor: myGrey,
  textTheme: baseTheme.textTheme.copyWith(
    bodyLarge: const TextStyle(
      color: myRed,
    ),
  ),
);



// only modify the colors here.  Everything else is set in baseTheme.
ThemeData darkTheme = baseTheme.copyWith(
  primaryColor: _Dark.fgText,
  primaryColorDark: _Dark.fgText,
  scaffoldBackgroundColor: _Dark.bgScaffold,
  hintColor: _Dark.fgText,
  cardColor: _Dark.bgCard,

  textTheme: baseTheme.textTheme.copyWith(
    bodyMedium: const TextStyle(
      color: _Dark.fgText,
    ),
    bodyLarge: const TextStyle(
      color: _Dark.fgText,
    ),
  ),

  inputDecorationTheme:
  baseTheme.inputDecorationTheme.copyWith(

  ),
);



