import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rasel_shop/app/app_colors.dart';
import 'package:rasel_shop/app/app_constants.dart';
import 'package:rasel_shop/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:rasel_shop/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:rasel_shop/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:rasel_shop/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:rasel_shop/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:rasel_shop/features/common/ui/widgets/snack_bar_message.dart';

import 'complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  static const String name = '/Otp-verification';
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpInsecs.obs;
  late Timer _timer;
  final RxBool _enabledResendCodeButton = false.obs;
  final OtpVerificationController _otpVerificationController =
      Get.find<OtpVerificationController>();

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

  Future<void> _onTapNext() async {
    if (_formKey.currentState!.validate()) {
      final bool response = await _otpVerificationController.verifyotp(
          widget.email, _otpTEController.text);
      if (response) {
        if (_otpVerificationController.shouldNavigateCompleteProfile) {
          if (mounted) {
            Navigator.pushNamed(context, CompleteProfileScreen.name);
          } else {
            if (mounted) {
              Navigator.pushNamedAndRemoveUntil(
                  context, MainBottomNavScreen.name, (predicate) => false);
            }
          }
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, _otpVerificationController.errorMessage!);
        }
      }
    }
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
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
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
                GetBuilder<OtpVerificationController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCirularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNext,
                    child: const Text('Next'),
                  );
                }),
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
                          _remainingTime.value =
                              AppConstants.resendOtpInsecs; // Reset timer
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
