import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rasel_shop/app/app_colors.dart';
import 'package:rasel_shop/app/app_constants.dart';
import 'package:rasel_shop/features/auth/ui/widgets/app_icon_widget.dart';

import 'complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/Otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpInsecs.obs;
  late Timer _timer;
  final RxBool _enabledResendCodeButton = false.obs;

  @override
  void initState() {
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    _enabledResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpInsecs;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.value > 0) {
        _remainingTime.value--;
      } else {
        _timer.cancel();
        _enabledResendCodeButton.value = true;
      }
    });
  }

  void _submitForm() {

   // if (_formKey.currentState!.validate()) {
      // Handle OTP submission logic here
   Navigator.pushNamed(context, CompleteProfileScreen.name);
   // }
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Verification')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const ApplogoWidget(),
                const SizedBox(height: 16),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 4 Digit Code has been sent',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: Appcolors.themeColor,
                    inactiveFillColor: Appcolors.themeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  controller: _otpTEController,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Please enter a valid OTP';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Next'),
                ),
                const SizedBox(height: 24),
                Obx(() => Visibility(
                  visible: !_enabledResendCodeButton.value,
                  child: RichText(
                    text: TextSpan(
                      text: 'This code will expire in ',
                      style: const TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: '${_remainingTime.value}s',
                          style: const TextStyle(color: Colors.cyanAccent),
                        ),
                      ],
                    ),
                  ),
                )),
                Obx(() => Visibility(
                  visible: _enabledResendCodeButton.value,
                  child: TextButton(
                    onPressed: () {
                      // Resend code logic here
                      _remainingTime.value = AppConstants.resendOtpInsecs; // Reset timer
                      _startResendCodeTimer(); // Restart timer
                    },
                    child: const Text('Resend Code'),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
