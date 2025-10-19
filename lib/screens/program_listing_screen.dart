import 'package:flutter/material.dart';
import '../models/program.dart';
import 'program_details_screen.dart';
import '../theme/app_colors.dart';

class ProgramListingScreen extends StatelessWidget {
  final List<Program> programs = [
    Program(
      id: '1',
      title: 'Flutter Basics',
      description: 'Learn Flutter from scratch',
      duration: '4 weeks',
    ),
    Program(
      id: '2',
      title: 'Advanced Flutter',
      description: 'Deep dive into Flutter',
      duration: '6 weeks',
    ),
    Program(
      id: '3',
      title: 'UI/UX Design',
      description: 'Design amazing apps',
      duration: '3 weeks',
    ),
  ];

  ProgramListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Programs')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return Card(
            color: AppColors.gray100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(program.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(program.description),
              trailing: Text(program.duration),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProgramDetailsScreen(program: program)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
