import 'package:flutter/material.dart';
import 'package:flutter_app/screens/application_form_screen.dart';
import '../models/program.dart';
import '../theme/app_colors.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Program program;

  const ProgramDetailsScreen({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: AppColors.background,
  appBar: AppBar(
    title: Text(program.title),
    backgroundColor: AppColors.primary,
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          program.title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          program.description,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text(
          'Duration: ${program.duration}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton.extended(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ApplicationFormScreen(
            programId: program.id,
            programTitle: program.title,
          ),
        ),
      );
    },
    backgroundColor: AppColors.primary,
    icon: const Icon(Icons.check_circle),
    label: const Text('Apply Now'),
  ),
);
  }
}
