import 'package:flutter/material.dart';
import '../models/program.dart';
import '../theme/app_colors.dart';
import 'program_details_screen.dart';

class ProgramListingScreen extends StatelessWidget {
  ProgramListingScreen({super.key});

  final List<Program> programs = [
    Program(
      id: '1',
      title: 'Flutter Basics',
      description: 'Learn Flutter from scratch',
      duration: '2 weeks',
    ),
    Program(
      id: '2',
      title: 'Advanced Flutter',
      description: 'Deep dive into Flutter',
      duration: '3 weeks',
    ),
    Program(
      id: '3',
      title: 'UI/UX Design',
      description: 'Design amazing apps',
      duration: '1 week',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Programs'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: programs.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final program = programs[index];
            return ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text(program.title),
              subtitle: Text('${program.description}\nDuration: ${program.duration}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgramDetailsScreen(program: program),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
