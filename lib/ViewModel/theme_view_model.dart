import 'package:flutter/material.dart';

import '../utils/styles.dart';

class ThemeViewModel extends ChangeNotifier {
  Icon get currentIcon => Icon(currentTheme.brightness == Brightness.dark
      ? Icons.wb_sunny
      : Icons.nights_stay);

  ThemeData currentTheme = Themes.lightTheme;

  void toggleTheme() {
      currentTheme = currentTheme.brightness == Brightness.dark
          ? Themes.lightTheme
          : Themes.darkTheme;

      notifyListeners();
  }
}