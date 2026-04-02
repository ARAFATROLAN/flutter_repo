import 'package:flutter/material.dart';

class TutorialsScreen extends StatelessWidget {
  const TutorialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> tutorials = [
      {"title": "Introduction to Science", "level": "Beginner"},
      {"title": "Basic Mathematics", "level": "Beginner"},
      {"title": "English Grammar", "level": "Intermediate"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Tutorials")),
      body: ListView.builder(
        itemCount: tutorials.length,
        itemBuilder: (context, index) {
          final item = tutorials[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(item["title"]!),
              subtitle: Text(item["level"]!),
              trailing: const Icon(Icons.play_arrow),
            ),
          );
        },
      ),
    );
  }
}