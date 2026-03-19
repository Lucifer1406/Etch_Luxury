import 'package:flutter/material.dart';

class AppColors {
  // Brand
  static const Color navyDark = Color(0xFF1A1F3C);
  static const Color vibrantBlue = Color(0xFF1E6FD9);
  static const Color purple = Color(0xFF4A3FC7);
  static const Color emergencyRed = Color(0xFFD93025);
  static const Color softRedBg = Color(0xFFF5E8E8);

  // Neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF7F8FC);
  static const Color textMuted = Color(0xFF7B8A9A);

  // Accents
  static const Color successGreen = Color(0xFF22C55E);
  static const Color avatarPink = Color(0xFFFFB3C1);
  static const Color avatarBlue = Color(0xFFB3D4FF);
  static const Color avatarTeal = Color(0xFF99E6D8);
  static const Color avatarPurple = Color(0xFFD4B3FF);

  // Gradients
  static const LinearGradient bluePurpleGradient = LinearGradient(
    colors: [vibrantBlue, purple],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient redWhiteGradient = LinearGradient(
    colors: [softRedBg, white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
