import 'package:flutter/material.dart';

class CenteredCirularProgressIndicator extends StatelessWidget {
  const CenteredCirularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
