import 'package:flutter/material.dart';
import 'science_screen.dart';
import 'math_screen.dart';
import 'english_screen.dart';
import 'sst_screen.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  String searchQuery = "";

  final List<Map<String, dynamic>> subjects = [
    {
      "title": "Mathematics",
      "icon": Icons.calculate,
      "screen": const MathScreen(),
      "progress": 0.7,
      "color": Colors.blue,
    },
    {
      "title": "Science",
      "icon": Icons.science,
      "screen": const ScienceScreen(),
      "progress": 0.5,
      "color": Colors.green,
    },
    {
      "title": "English",
      "icon": Icons.menu_book,
      "screen": const EnglishScreen(),
      "progress": 0.3,
      "color": Colors.orange,
    },
    {
      "title": "SST",
      "icon": Icons.public,
      "screen": const SSTScreen(),
      "progress": 0.6,
      "color": Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredSubjects = subjects.where((subj) {
      return subj["title"]
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF282A35),

      appBar: AppBar(
        title: const Text("Subjects"),
        centerTitle: true,
        backgroundColor: const Color(0xFF04AA6D),
        elevation: 0,
      ),

      body: Column(
        children: [
          // 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              onChanged: (val) {
                setState(() => searchQuery = val);
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Search subjects...",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 📚 SUBJECT GRID
          Expanded(
            child: filteredSubjects.isEmpty
                ? const Center(
                    child: Text(
                      "No subjects found",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: filteredSubjects.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final subject = filteredSubjects[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => subject["screen"] as Widget,
                            ),
                          );
                        },

                        // ✨ CARD
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                (subject["color"] as Color).withOpacity(0.7),
                                (subject["color"] as Color),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(15),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                subject["icon"],
                                size: 45,
                                color: Colors.white,
                              ),

                              const SizedBox(height: 10),

                              Text(
                                subject["title"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 15),

                              // 📊 PROGRESS BAR
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: subject["progress"],
                                  minHeight: 8,
                                  backgroundColor: Colors.white24,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "${(subject["progress"] * 100).toInt()}% completed",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}