import 'package:flutter/material.dart';
import 'package:rasel_shop/features/auth/ui/screeens/otp_verification_screen.dart';
import 'package:rasel_shop/features/auth/ui/widgets/app_icon_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = '/email-verification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle the email submission
      final email = _emailTEController.text;
      Navigator.pushNamed(context, OtpVerificationScreen.name);
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
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email Address'),
                  validator: (String?value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
                    final regex = RegExp(emailPattern);
                    if (!regex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
