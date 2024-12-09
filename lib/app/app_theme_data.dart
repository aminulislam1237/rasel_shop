import 'package:flutter/material.dart';
import 'package:rasel_shop/app/app_colors.dart';

class AppThemeData{
  static ThemeData get lightThemeData{
    return ThemeData(
     colorSchemeSeed: Appcolors.themeColor,
      progressIndicatorTheme:  const ProgressIndicatorThemeData(
        color: Appcolors.themeColor,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }


  static ThemeData get darkThemeData{
    return ThemeData(
      colorSchemeSeed: Appcolors.themeColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Appcolors.themeColor,
      ),
      scaffoldBackgroundColor: Colors.grey,
      brightness: Brightness.dark,
    );
  }
}