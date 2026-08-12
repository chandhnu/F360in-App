import 'package:flutter/material.dart';

class AppTheme {
  static const Color wealthGreen = Color(0xFF00C853);
  static const Color riskRed = Color(0xFFFF3D00);
  static const Color neutralGray = Color(0xFF424242);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color darkBackground = Color(0xFF0A0E27);
  static const Color darkSurface = Color(0xFF1A1F3A);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: ColorScheme.dark(
        primary: wealthGreen,
        secondary: accentBlue,
        error: riskRed,
        surface: darkSurface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: darkText,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: darkText),
        headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: darkText, letterSpacing: 0.5),
        bodyMedium: TextStyle(fontSize: 16, color: darkText, height: 1.5),
        labelSmall: TextStyle(fontSize: 12, color: darkTextSecondary, letterSpacing: 0.5),
      ),
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: wealthGreen,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),
    );
  }
}
