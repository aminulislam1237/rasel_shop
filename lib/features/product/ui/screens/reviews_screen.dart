import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.productId});

  final int productId;

  static const String name = '/product/review';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final List<TextEditingController> _controllers = List.generate(3, (_) => TextEditingController());

  void _submitReviews() {
    List<String> reviews = [];
    for (var controller in _controllers) {
      if (controller.text.isNotEmpty) {
        reviews.add(controller.text.trim());
        controller.clear();
      }
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Write review ...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30,),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Write review .',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30,),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Write review ...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 160,),
            ElevatedButton(
              onPressed: _submitReviews,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
