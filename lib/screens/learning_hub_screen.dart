import 'package:flutter/material.dart';


class LearningHubScreen extends StatelessWidget {
  const LearningHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {"title": "Science", "icon": Icons.science, "color": Colors.green},
      {"title": "Mathematics", "icon": Icons.calculate, "color": Colors.blue},
      {"title": "English", "icon": Icons.menu_book, "color": Colors.orange},
      {"title": "SST", "icon": Icons.public, "color": Colors.purple},
    ];

    final List<Map<String, dynamic>> resources = [
      {"title": "Local Content", "icon": Icons.location_on},
      {"title": "International Content", "icon": Icons.language},
      {"title": "Offline Materials", "icon": Icons.download},
      {"title": "Revision Papers", "icon": Icons.description},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning Hub"),
        backgroundColor: const Color(0xFF04AA6D),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose a Subject",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subjects.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final item = subjects[index];
                return _card(item["title"], item["icon"], item["color"]);
              },
            ),

            const SizedBox(height: 30),

            const Text(
              "Learning Resources",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Column(
              children: resources.map((item) {
                return Card(
                  child: ListTile(
                    leading: Icon(item["icon"], color: Colors.green),
                    title: Text(item["title"]),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}