import 'package:flutter/material.dart';

class AppTheme {
  // Primary Theme Colors
  static const Color primaryColor = Color(0xFF6f8bef);
  static const Color secondaryColor = Color(0xFF272727);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFf45757);

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold), // Fixed
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87, fontWeight: FontWeight.w500), // Medium weight
      bodySmall: TextStyle(fontSize: 14.0, color: Colors.black87, fontWeight: FontWeight.w400), // Regular weight
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold), // Fixed
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white70, fontWeight: FontWeight.w500), // Medium weight
      bodySmall: TextStyle(fontSize: 14.0, color: Colors.white70, fontWeight: FontWeight.w400), // Regular weight
    ),
  );
}
