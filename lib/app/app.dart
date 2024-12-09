import 'package:flutter/material.dart';
import 'package:rasel_shop/app/app_theme_data.dart';
import 'package:rasel_shop/features/auth/ui/screeens/splash_screen.dart';

class Craftybay extends StatelessWidget {
  const Craftybay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightThemeData, // Use the defined theme
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemeData.darkThemeData,
      //themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const SplashScreen(), // Fallback screen
      ),
    );
  }
}
