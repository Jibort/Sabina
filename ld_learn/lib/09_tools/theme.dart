// Tema visual per a l'aplicació.
// createdAt: 24/07/22 dl. JIQ

// Text Colors.

import 'package:flutter/material.dart';

const Color scaffoldBgColor = Color.fromARGB(255, 103, 177, 238);
const Color scaffoldFgColor = Colors.black;
final Color appBarBgColor = scaffoldBgColor.darken(0.1);
const Color appBarFgColor = scaffoldFgColor;
final Color appBarProgBgColor = appBarBgColor;
final Color appBarProgFgColor = Colors.grey[300]!;
final Color appBarLineProgFbColor = Colors.blue[600]!;

// ALTERACIÓ DE COLORS --------------
extension Alter on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
