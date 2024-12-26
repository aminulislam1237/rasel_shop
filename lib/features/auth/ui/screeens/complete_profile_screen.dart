import 'package:flutter/material.dart';
import 'package:rasel_shop/features/auth/ui/screeens/otp_verification_screen.dart';
import 'package:rasel_shop/features/auth/ui/widgets/app_icon_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/Complete-Profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _fristNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle the email submission
      Navigator.pushNamed(context, OtpVerificationScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const ApplogoWidget(
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 30, // Adjust font size as needed
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Get Started with us with your details',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 24),
              _buildForm(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _fristNameTEController,
            decoration: const InputDecoration(
              hintText: 'First Name',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter your Frist Name .';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: const InputDecoration(
              hintText: 'Last Name',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter your last Name.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLength: 14,
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: 'Mobile Number',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter your Mobile Number.';
              }
              if (RegExp(r'^(?:\+8801[3-9]\d{8}|01[3-9]\d{8})$')
                      .hasMatch(value!) ==
                  false) {
                return 'Invalid Mobile Number. Please enter valid number.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityTEController,
            decoration: const InputDecoration(
              hintText: 'City Name',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter your City.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _shippingAddressTEController,
            keyboardType: TextInputType.multiline,
            maxLength: 100,
            minLines: 2,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Shipping Address',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Please enter your shipping address.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fristNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}
