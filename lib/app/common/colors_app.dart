import 'package:flutter/painting.dart';

class ColorsApp {
  static const green = Color(0xFF72BC53);
  static const blackPrimary = Color(0xFF000000);
  static const blackSecondary = Color(0xFF231F20);
  static const whitePrimary = Color(0xFFFFFFFF);
  static const whiteSecondary = Color(0xFFEAEAEA);
  static const gray = Color(0xFFD9D9D9);
  static const purplePrimary = Color(0xFF572C44);
  static const purpleSecondary = Color(0xFF60304E);
  static const lightPurple = Color(0xFF6E3E5F);

  static const purpleLinearGradient = LinearGradient(
    colors: [
      Color(0xFF501F3A),
      Color(0xFFAF81B0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
