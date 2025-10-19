import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/program.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final String programId;

  const ProgramDetailsScreen({Key? key, required this.programId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Find the program by id
    final program = Program.getPrograms().firstWhere((p) => p.id == programId);

    return Scaffold(
      backgroundColor: AppColors.gray50,
      appBar: AppBar(
        backgroundColor: AppColors.gray50,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.share, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.bookmark_border, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Program Title
            Text(program.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 8),
            // Program Description
            Text(program.description, style: const TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 16),
            // Program Details (Duration, Level)
            Row(
              children: [
                Chip(
                  label: Text(program.duration, style: const TextStyle(color: Colors.white)),
                  backgroundColor: AppColors.primary,
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(program.level, style: const TextStyle(color: Colors.white)),
                  backgroundColor: AppColors.secondary,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Example: Learners or stats
            Text('Learners', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildLearnerAvatar('JD', AppColors.primary),
                _buildLearnerAvatar('SM', AppColors.secondary),
                _buildLearnerAvatar('AL', AppColors.purpleGradient[0]),
                _buildLearnerAvatar('+99', AppColors.gray400),
              ],
            ),
            const SizedBox(height: 20),
            // Example: Progress
            Text('Progress', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.78, // example progress
              backgroundColor: AppColors.gray100,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearnerAvatar(String initials, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Text(initials, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
