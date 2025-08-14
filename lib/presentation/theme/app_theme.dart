import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0ea5e9); // sky-500
  static const Color accentColorPulse = Color(0xFFf43f5e); // rose-500
  static const Color accentColorVoltage = Color(0xFF0ea5e9); // sky-500
  static const Color accentColorGhost = Color(0xFF10b981); // emerald-500
  static const Color backgroundColor = Color(0xFFf8fafc); // slate-50
  static const Color darkBackgroundColor = Color(0xFFe2e8f0); // slate-200
  static const Color textColor = Color(0xFF1e293b); // slate-800
  static const Color subtleTextColor = Color(0xFF64748b); // slate-500

  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: subtleTextColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 48.0, fontWeight: FontWeight.bold, color: textColor),
        titleLarge: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.bold, color: textColor),
        bodyMedium: TextStyle(fontSize: 16.0, color: textColor),
        bodySmall: TextStyle(fontSize: 14.0, color: subtleTextColor),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      ),
    );
  }
}
