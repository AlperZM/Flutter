import 'package:flutter/material.dart';
import 'states.dart';

class AppTheme {
  static ThemeData lightTheme(double fontSize) {
    return ThemeData(
      
    );
  }
}


/* // states.dart dosyasını import ediyoruz

class AppTheme {
  static ThemeData lightTheme(double fontSize) {
    return ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      // Diğer light tema özellikleri
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: fontSize),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
    );
  }

  static ThemeData darkTheme(double fontSize) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.grey[900],
      // Diğer dark tema özellikleri
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: fontSize, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}

*/
