import 'package:flutter/material.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  State<StudentDashboardScreen> createState() =>
      _StudentDashboardScreenState();
}

class _StudentDashboardScreenState
    extends State<StudentDashboardScreen> {
  double progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Learning Dashboard"),
        backgroundColor: const Color(0xFF04AA6D),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back 👋",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // ✅ PROGRESS TRACKING
            const Text("Your Progress"),
            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),

            const SizedBox(height: 30),

            // ✅ SUBJECTS
            const Text(
              "Subjects",
              style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: [
                _chip("Science"),
                _chip("Math"),
                _chip("English"),
                _chip("SST"),
              ],
            ),

            const SizedBox(height: 30),

            // ✅ TEXTBOOKS
            const Text(
              "Textbooks",
              style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _bookTile("Primary Science Book 1"),
            _bookTile("Mathematics Basics"),
            _bookTile("English Grammar Guide"),

            const SizedBox(height: 30),

            // ✅ QUIZZES
            const Text(
              "Quick Quiz",
              style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.green.shade100,
    );
  }

  Widget _bookTile(String title) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {},
      ),
    );
  }
}