import 'package:flutter/material.dart';

class ReferencesScreen extends StatelessWidget {
  const ReferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("References"),
        backgroundColor: const Color(0xFF04AA6D),
      ),
      body: const Center(
        child: Text("References coming soon..."),
      ),
    );
  }
}