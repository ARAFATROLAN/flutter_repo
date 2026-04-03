import 'package:flutter/material.dart';

class SubjectContentScreen extends StatefulWidget {
  final String subject;

  const SubjectContentScreen({super.key, required this.subject});

  @override
  State<SubjectContentScreen> createState() => _SubjectContentScreenState();
}

class _SubjectContentScreenState extends State<SubjectContentScreen> {
  int currentIndex = 0;
  bool showQuiz = false;

  final List<Map<String, dynamic>> topics = [
    {
      "title": "Introduction",
      "content": "This is a simple explanation of the topic for primary students.",
      "quiz": {
        "question": "What did you learn?",
        "options": ["Basics", "Nothing", "Advanced", "Skip"],
        "answer": 0
      }
    },
    {
      "title": "Examples",
      "content": "Here are simple examples to help you understand.",
      "quiz": {
        "question": "Examples help you?",
        "options": ["Understand", "Confuse", "Ignore", "None"],
        "answer": 0
      }
    }
  ];

  void nextStep() {
    if (!showQuiz) {
      setState(() => showQuiz = true);
    } else {
      if (currentIndex < topics.length - 1) {
        setState(() {
          currentIndex++;
          showQuiz = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You completed this topic 🎉")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final topic = topics[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(widget.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(topic["title"],
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),

            if (!showQuiz)
              Text(topic["content"], style: const TextStyle(fontSize: 16)),

            if (showQuiz) ...[
              Text(topic["quiz"]["question"],
                  style: const TextStyle(fontSize: 18)),

              const SizedBox(height: 10),

              ...List.generate(topic["quiz"]["options"].length, (index) {
                return ListTile(
                  title: Text(topic["quiz"]["options"][index]),
                  leading: const Icon(Icons.circle_outlined),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          index == topic["quiz"]["answer"]
                              ? "Correct ✅"
                              : "Try again ❌",
                        ),
                      ),
                    );
                  },
                );
              })
            ],

            const Spacer(),

            ElevatedButton(
              onPressed: nextStep,
              child: Text(showQuiz ? "Continue" : "Take Quiz"),
            )
          ],
        ),
      ),
    );
  }
}