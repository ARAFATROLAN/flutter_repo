import 'package:flutter/material.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  final List<Map<String, String>> books = const [
    {
      "title": "Primary Science - Uganda",
      "source": "Ministry of Education",
      "link": "https://www.education.go.ug/resources/science-textbook.pdf"
    },
    {
      "title": "International Science Basics",
      "source": "Global Education",
      "link": "https://www.example.com/international-science.pdf"
    },
  ];

  void _showMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Opening \"$title\" is not available right now"),
        backgroundColor: const Color(0xFF04AA6D),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282A35),

      appBar: AppBar(
        title: const Text("Science Resources"),
        backgroundColor: const Color(0xFF04AA6D),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1F26),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),

              leading: const Icon(Icons.science, color: Color(0xFF04AA6D)),

              title: Text(
                book["title"]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                book["source"]!,
                style: const TextStyle(color: Colors.white70),
              ),

              trailing: const Icon(Icons.arrow_forward, color: Color(0xFF04AA6D)),

              onTap: () => _showMessage(context, book["title"]!),
            ),
          );
        },
      ),
    );
  }
}