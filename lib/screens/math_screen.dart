import 'package:flutter/material.dart';
import 'exercises_screen.dart';
import 'references_screen.dart';
import 'notes_screen.dart';

class MathScreen extends StatelessWidget {
  const MathScreen({super.key});

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mathematics"),
        backgroundColor: const Color(0xFF04AA6D),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calculate, size: 80, color: Color(0xFF04AA6D)),
            const SizedBox(height: 20),
            const Text(
              "Math Lessons & Resources",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _navigate(context, const ExercisesScreen()),
              icon: const Icon(Icons.fitness_center),
              label: const Text("Exercises"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF04AA6D),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () => _navigate(context, const quizzesScreen() as Widget),
              icon: const Icon(Icons.quiz),
              label: const Text("Quizzes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF04AA6D),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () => _navigate(context, const ReferencesScreen()),
              icon: const Icon(Icons.book),
              label: const Text("References"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF04AA6D),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () => _navigate(context, NotesScreen(subject: '',)),
              icon: const Icon(Icons.note),
              label: const Text("Notes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF04AA6D),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class quizzesScreen {
  const quizzesScreen();
}