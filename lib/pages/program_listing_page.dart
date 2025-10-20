import 'package:flutter/material.dart';
import 'program_details_page.dart'; // Make sure this import matches your file structure

class ProgramListingPage extends StatelessWidget {
  const ProgramListingPage({super.key});

  final List<Map<String, String>> programs = const [
    {"title": "Flutter Basics", "description": "Learn the basics of Flutter."},
    {"title": "3D Game Dev", "description": "Create a 3D game for kids."},
    {
      "title": "Python Fundamentals",
      "description": "Learn Python programming.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Programs")),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return ListTile(
            title: Text(program["title"]!),
            subtitle: Text(program["description"]!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProgramDetailsPage(
                    title: program["title"]!,
                    description: program["description"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
