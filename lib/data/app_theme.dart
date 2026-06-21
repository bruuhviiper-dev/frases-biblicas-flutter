import 'package:flutter/material.dart';

/// Tema do app — tons espirituais (índigo/roxo com dourado).
class AppTheme {
  AppTheme._();

  static const brand = Color(0xFF4338CA); // índigo
  static const brandDark = Color(0xFF1E1B4B);
  static const gold = Color(0xFFD4AF37);

  /// Gradiente do "Versículo do dia" e da marca.
  static const hero = [Color(0xFF4338CA), Color(0xFF1E1B4B)];

  static LinearGradient gradient(List<Color> colors) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
      );

  static ThemeData light([Color accent = brand]) {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.light),
      scaffoldBackgroundColor: const Color(0xFFF7F6FB),
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }

  static ThemeData dark([Color accent = brand]) {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.dark),
      scaffoldBackgroundColor: const Color(0xFF121018),
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }
}
