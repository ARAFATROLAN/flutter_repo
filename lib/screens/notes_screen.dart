import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  final String subject;

  // FIX: Add Key? key to constructor
  NotesScreen({super.key, required this.subject});

  final List<Map<String, String>> notes = [
    {
      "title": "Algebra Basics",
      "content": "Algebra is about finding unknown values using symbols."
    },
    {
      "title": "Equations",
      "content": "An equation shows that two expressions are equal."
    }
  ];

  @override
Widget build(BuildContext context) {

  final List<Map<String, String>> notes = [
    {
      "title": "Algebra Basics",
      "content": "Algebra is about finding unknown values using symbols."
    },
    {
      "title": "Equations",
      "content": "An equation shows that two expressions are equal."
    }
  ];

  return Scaffold(
    appBar: AppBar(title: Text(subject)),
    body: ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notes[index]["title"]!),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(notes[index]["title"]!),
                content: Text(notes[index]["content"]!),
              ),
            );
          },
        );
      },
    ),
  );
}
}