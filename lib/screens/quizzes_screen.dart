import 'package:flutter/material.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizzes"),
        backgroundColor: const Color(0xFF04AA6D),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ListTile(
            leading: Icon(Icons.quiz, color: Color(0xFF04AA6D)),
            title: Text("Science Quiz"),
          ),
          ListTile(
            leading: Icon(Icons.quiz, color: Color(0xFF04AA6D)),
            title: Text("Math Quiz"),
          ),
          ListTile(
            leading: Icon(Icons.quiz, color: Color(0xFF04AA6D)),
            title: Text("English Quiz"),
          ),
          ListTile(
            leading: Icon(Icons.quiz, color: Color(0xFF04AA6D)),
            title: Text("SST Quiz"),
          ),
        ],
      ),
    );
  }
}