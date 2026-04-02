import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/notes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LearnBox',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomeScreen(), // ✅ Entry screen
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> subjects = const [
    "Mathematics",
    "English",
    "Science",
    "Social Studies"
  ];

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("LearnBox")),
      backgroundColor: Colors.grey[200],

      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // ✅ FIXED (was too crowded)
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.2,
        ),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      NotesScreen(subject: subjects[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: colors[index % colors.length].withOpacity(0.15),
                border: Border.all(
                  color: colors[index % colors.length],
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  subjects[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18, // ✅ FIXED (was too large)
                    fontWeight: FontWeight.bold,
                    color: colors[index % colors.length],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}