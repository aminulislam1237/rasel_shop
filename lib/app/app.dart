import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/app/app_theme_data.dart';
import 'package:rasel_shop/app/controller_binder.dart';
import 'package:rasel_shop/features/auth/ui/screeens/otp_verification_screen.dart';
import 'package:rasel_shop/features/auth/ui/screeens/splash_screen.dart';
import 'package:rasel_shop/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:rasel_shop/features/home/ui/screeens/home_screen.dart';

import '../features/auth/ui/screeens/complete_profile_screen.dart';
import '../features/auth/ui/screeens/email_varification_screen.dart';

class Craftybay extends StatelessWidget {
  const Craftybay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.lightThemeData, // Use the defined theme
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemeData.lightThemeData,
      //themeMode: ThemeMode.dark,
      initialRoute: '/',
      initialBinding: ControllerBinder(),
      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) =>
            const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) =>
        const OtpVerificationScreen(),
        CompleteProfileScreen.name: (context) =>
        const CompleteProfileScreen(),
        MainBottomNavScreen.name: (context) =>
        const MainBottomNavScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const SplashScreen(), // Fallback screen
      ),
    );
  }
}
