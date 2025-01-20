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
import 'package:rasel_shop/features/product/ui/screens/product_details_screen.dart';
import 'package:rasel_shop/features/product/ui/screens/product_list_screen.dart';
import 'package:rasel_shop/features/wishlist/ui/screens/wish_list_screen.dart';

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

        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == EmailVerificationScreen.name) {
          widget = const EmailVerificationScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          String email = settings.arguments as String;
          widget = OtpVerificationScreen(email: email);
        } else if (settings.name == CompleteProfileScreen.name) {
          widget = const CompleteProfileScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          String name = settings.arguments as String;
          widget = ProductListScreen(categoryName: name);
        } else if (settings.name == ProductDetailsScreen.name) {
          int productId = settings.arguments as int;
          widget = ProductDetailsScreen(productId: productId);
        } else {
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
