import 'package:flutter/material.dart';
import '../widgets/app_icon_widget.dart';
import 'email_varification_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, EmailVerificationScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
            ApplogoWidget(),
              Spacer(),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}