import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rasel_shop/app/app_colors.dart';
import 'package:rasel_shop/features/auth/ui/widgets/app_icon_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/Otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle the email submission
      final email = _otpTEController.text;
      // Navigate to the next screen or perform your logic here
      print('Email submitted: $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Next'),
                ),
                const SizedBox(
                  height: 24,
                ),
                //TODO:enable button when 120s is done and invisible the text
                //
                RichText(
                    text: const TextSpan(
                        text: 'This code will be expire in',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        children: [
                      TextSpan(
                          text: '120',
                          style: TextStyle(
                            color: Colors.cyanAccent,
                          ),)
                    ],
                    ),
                ),
                TextButton(onPressed: (){}, child: Text('Resend Code'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
