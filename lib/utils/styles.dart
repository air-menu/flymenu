import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Couleur {
  static const blue = Color(0xFF217FB4);
  static const red = Color(0xFFC50909);
  static const lightGray = Color(0x0C30363D);
  static const gray = Color(0xFF828282);
  static const black = Colors.black;
  static const darkGray = Color(0xFF333333);
  static const white = Colors.white;
  static const darkwhite = Color(0xFFE5E5E5);
  static const orange = Color(0xFFFFA62B);
  static const darkorange = Color.fromARGB(255, 209, 118, 7);
  static const green = Color(0xFF5CB85C);
  static const offWhite = Color(0xFFEAF0FC);
  static const lightBrown = Color(0x19E94B1B);
  static const rose = Color(0xFFF4F5F5);
  static const mediumGray = Color(0x7F30363D);
}

class Themes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: GoogleFonts.interTextTheme(),
    colorScheme: const ColorScheme(
      tertiary: Couleur.rose,
      brightness: Brightness.light,
      primary: Couleur.blue,
      onPrimary: Couleur.white,
      secondary: Couleur.blue,
      onSecondary: Couleur.white,
      surface: Couleur.lightGray,
      onSurface: Couleur.gray,
      background: Couleur.white,
      onBackground: Couleur.black,
      error: Couleur.red,
      onError: Couleur.white,
      outline: Couleur.gray,
    ),
    focusColor: Couleur.lightBrown,
    unselectedWidgetColor: Colors.white,
    scaffoldBackgroundColor: Couleur.white,
    visualDensity: VisualDensity.comfortable,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Couleur.white,
      foregroundColor: Couleur.black,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 178, 176, 176)),
    ),
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Couleur.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.48,
      ),
      titleMedium: TextStyle(
        color: Couleur.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.48,
      ),
      titleSmall: TextStyle(
        color: Couleur.darkGray,
        fontSize: 14
      ),
      bodySmall: TextStyle(
        color: Couleur.darkGray,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        color: Couleur.mediumGray,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 0,
        letterSpacing: -0.32,
      ),
      bodyLarge: TextStyle(
        color: Couleur.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 0,
        letterSpacing: -0.32,
      ),
      labelLarge: TextStyle(
        color: Couleur.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      labelMedium: TextStyle(
        color: Couleur.blue,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
      labelSmall: TextStyle(
        color: Couleur.blue,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: GoogleFonts.interTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Couleur.white,
      onPrimary: Couleur.black,
      secondary: Couleur.white,
      onSecondary: Couleur.white,
      surface: Couleur.gray,
      onSurface: Couleur.white,
      background: Couleur.black,
      onBackground: Couleur.white,
      error: Couleur.red,
      onError: Couleur.white,
      tertiary: Couleur.rose
    ),
    focusColor: Couleur.lightBrown,
    unselectedWidgetColor: Couleur.gray,
    scaffoldBackgroundColor: Couleur.black,
    visualDensity: VisualDensity.comfortable,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Couleur.black,
      foregroundColor: Couleur.white,
      iconTheme: IconThemeData(
        color: Color(0xFF808080),
      ),
    ),
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Couleur.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.48,
      ),
      titleMedium: TextStyle(
        color: Couleur.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.48,
      ),
      titleSmall: TextStyle(
          color: Couleur.black,
          fontSize: 14
      ),
      bodySmall: TextStyle(
        color: Couleur.white,
        fontSize: 12,
      ),
      labelLarge: TextStyle(
        color: Couleur.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      labelMedium: TextStyle(
        color: Couleur.blue,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
      labelSmall: TextStyle(
        color: Couleur.blue,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData dimTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.inter().fontFamily,
    textTheme: GoogleFonts.interTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Couleur.red,
      onPrimary: Couleur.white,
      secondary: Couleur.blue,
      onSecondary: Couleur.white,
      surface: Couleur.gray,
      onSurface: Couleur.white,
      background: Couleur.darkGray,
      onBackground: Couleur.white,
      error: Couleur.red,
      onError: Couleur.white,
    ),
    scaffoldBackgroundColor: Couleur.darkGray,
    visualDensity: VisualDensity.comfortable,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Couleur.darkGray,
      iconTheme: IconThemeData(color: Couleur.white),

    ),
  );
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get font => theme.textTheme;
  ColorScheme get colour => theme.colorScheme;
}

(TextTheme, String) buildFonts(bool isTest) {
  final family = GoogleFonts.inter().fontFamily!;
  final theme = GoogleFonts.interTextTheme();

  if (isTest) {
    return (theme, family);
  }

  return (theme, family);
}
