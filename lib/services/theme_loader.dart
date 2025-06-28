import 'package:flutter/material.dart';

class ThemeLoader {
  static ThemeData buildThemeFromJson(Map<String, dynamic> json) {
    final primaryHex = json['primaryColor'] as String;
    final secondaryHex = json['secondaryColor'] as String? ?? '#FFFFFF';
    final Color primaryColor = _hexToColor(primaryHex);
    final Color secondaryColor = _hexToColor(secondaryHex);

    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, secondary: secondaryColor),
      useMaterial3: true,
    );
  }

  static Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }
}
