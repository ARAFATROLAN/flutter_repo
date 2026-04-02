import 'package:flutter/material.dart';

class PastPapersScreen extends StatelessWidget {
  const PastPapersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Past Papers"),
        backgroundColor: const Color(0xFF04AA6D),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(Icons.description, color: Color(0xFF04AA6D)),
              title: Text("Past Paper ${index + 1}"),
              subtitle: const Text("Previous year exam paper."),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Open Past Paper ${index + 1}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}