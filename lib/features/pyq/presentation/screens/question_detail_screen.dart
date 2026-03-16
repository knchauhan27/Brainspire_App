import 'package:flutter/material.dart';

class QuestionDetailScreen extends StatelessWidget {
  final String questionId;

  const QuestionDetailScreen({super.key, required this.questionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question Details')),
      body: const Center(
        child: Text('Question Detail Screen - Under Development'),
      ),
    );
  }
}
