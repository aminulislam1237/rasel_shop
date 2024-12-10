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
      appBarTheme:  const AppBarTheme(
        //backgroundColor: Colors.white,
        elevation: 3,
        color: Colors.white,
      ),
      textTheme: const TextTheme(
        titleLarge:TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.themeColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.themeColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.themeColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolors.themeColor,
          foregroundColor: Colors.white,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          textStyle:
          const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Appcolors.themeColor,
        )
      )
      );
  }

}