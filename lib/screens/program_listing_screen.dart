import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/program.dart';
import 'program_details_screen.dart';

class ProgramListingScreen extends StatelessWidget {
  const ProgramListingScreen({Key? key}) : super(key: key);

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return AppColors.success;
      case 'completed':
        return AppColors.primary;
      case 'pending':
        return AppColors.secondary;
      default:
        return AppColors.gray500;
    }
  }

  @override
  Widget build(BuildContext context) {
    final programs = Program.getPrograms();

    return Scaffold(
      backgroundColor: AppColors.gray50,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Programs'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProgramDetailsScreen(programId: program.id)),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: program.gradientColors),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      program.icon == 'award' ? Icons.emoji_events : Icons.book_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(program.title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(program.description, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(program.duration, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(program.status),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(program.status, style: const TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
