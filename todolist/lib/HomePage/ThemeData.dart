import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    accentColor: Colors.amber[800],
    primaryColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.amber[800],
      shadowColor: Colors.grey[300],
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
    ),
    brightness: Brightness.dark,
  );
}

ThemeData lightTheme() {
  return ThemeData(
    accentColor: Colors.red[700],
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red[700],
      shadowColor: Colors.red[300],
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
    ),
    brightness: Brightness.light,
  );
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setLightTheme() {
    _themeData = lightTheme();
    notifyListeners();
  }

  setDarkTheme() {
    _themeData = darkTheme();
    notifyListeners();
  }
}
