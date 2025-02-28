import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:rasel_shop/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:rasel_shop/features/common/ui/widgets/center_circular_progress_indicator.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../common/ui/screens/main_bottom_nav_screen.dart';
import '../../../common/ui/widgets/snack_bar_message.dart' show showSnackBarMessage;
import '../controllers/otp_verification_controller.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});
  static const String name = '/otp-verification';
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  final RxBool _enableResendCodeButton = false.obs;
  final OtpVerificationController _otpVerificationController =
  Get.find<OtpVerificationController>();

  @override
  void initState() {
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;
      if (_remainingTime.value == 0) {
        t.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
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
                  'A 4 digit otp has been sent to your email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: AppColors.themeColor,
                      inactiveColor: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8)),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  controller: _otpTEController,
                  validator: (String? value) {
                    if (value?.length != 4) {
                      return 'Enter your otp';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<OtpVerificationController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Next'),
                  );
                }),
                const SizedBox(height: 24),
                Obx(
                      () => Visibility(
                    visible: !_enableResendCodeButton.value,
                    child: RichText(
                      text: TextSpan(
                        text: 'This code will be expire in ',
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: '${_remainingTime}s',
                            style: const TextStyle(
                              color: AppColors.themeColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                      () => Visibility(
                    visible: _enableResendCodeButton.value,
                    child: TextButton(
                      onPressed: () {
                        _startResendCodeTimer();
                      },
                      child: const Text('Resend Code'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool response = await _otpVerificationController.verifyOtp(
          widget.email, _otpTEController.text);
      if (response) {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainBottomNavScreen.name, (predicate) => false);
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
    timer.cancel();
    super.dispose();
  }
}