import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/app/app_theme_data.dart';
import 'package:rasel_shop/app/controller_binder.dart';
import 'package:rasel_shop/features/auth/ui/screeens/complete_profile_screen.dart';
import 'package:rasel_shop/features/auth/ui/screeens/email_varification_screen.dart';
import 'package:rasel_shop/features/auth/ui/screeens/otp_verification_screen.dart';
import 'package:rasel_shop/features/auth/ui/screeens/splash_screen.dart';
import 'package:rasel_shop/features/category/ui/screens/category_list_screen.dart';
import 'package:rasel_shop/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:rasel_shop/features/product/ui/screens/product_list_screen.dart';

class Craftybay extends StatelessWidget {
  const Craftybay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.lightThemeData, // Use the defined theme
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemeData.lightThemeData,
      initialRoute: '/',
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;

        switch (settings.name) {
          case SplashScreen.name:
            widget = const SplashScreen();
            break;
          case EmailVerificationScreen.name:
            widget = const EmailVerificationScreen();
            break;
          case OtpVerificationScreen.name:
            widget = const OtpVerificationScreen();
            break;
          case CompleteProfileScreen.name:
            widget = const CompleteProfileScreen();
            break;
          case MainBottomNavScreen.name:
            widget = const MainBottomNavScreen();
            break;
          case CategoryListScreen.name:
            widget = const CategoryListScreen();
            break;
          case ProductListScreen.name:
            String name = settings.arguments as String;
            widget = ProductListScreen(categoryName: name);
            break;
          default:
            widget = const SplashScreen(); // Fallback for unknown routes
        }

        return MaterialPageRoute(builder: (ctx) => widget);
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const SplashScreen(), // Fallback screen
      ),
    );
  }
}
