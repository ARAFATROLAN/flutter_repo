import 'package:flutter/material.dart';
import 'exercises_screen.dart';
import 'references_screen.dart';
import 'notes_screen.dart';
import 'quizzes_screen.dart';

class SSTScreen extends StatelessWidget {
  const SSTScreen({super.key});

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SST"),
        backgroundColor: const Color(0xFF04AA6D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.public, size: 80, color: Color(0xFF04AA6D)),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () => _navigate(context, const ExercisesScreen()),
              icon: const Icon(Icons.fitness_center),
              label: const Text("Exercises"),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () => _navigate(context, const QuizzesScreen()),
              icon: const Icon(Icons.quiz),
              label: const Text("Quizzes"),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () => _navigate(context, const ReferencesScreen()),
              icon: const Icon(Icons.book),
              label: const Text("References"),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () =>
                  _navigate(context,NotesScreen(subject: 'SST')),
              icon: const Icon(Icons.note),
              label: const Text("Notes"),
            ),
          ],
        ),
      ),
    );
  }
}