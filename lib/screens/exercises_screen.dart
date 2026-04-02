import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercises"),
        backgroundColor: const Color(0xFF04AA6D),
      ),
      body: const Center(
        child: Text("Exercises coming soon..."),
      ),
    );
  }
}