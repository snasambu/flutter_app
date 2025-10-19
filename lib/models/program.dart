import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Program {
  final String id;
  final String title;
  final String description;
  final String duration;
  final String status;
  final String level;
  final String icon;
  final List<Color> gradientColors;

  Program({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.status,
    required this.level,
    required this.icon,
    required this.gradientColors,
  });

  // Sample static method to return dummy programs
  static List<Program> getPrograms() {
    return [
      Program(
        id: '1',
        title: 'Flutter Basics',
        description: 'Learn Flutter from scratch.',
        duration: '3h 30m',
        status: 'active',
        level: 'beginner',
        icon: 'book',
        gradientColors: AppColors.primaryGradient,
      ),
      Program(
        id: '2',
        title: 'Advanced Flutter',
        description: 'Advanced Flutter concepts.',
        duration: '5h 0m',
        status: 'completed',
        level: 'advanced',
        icon: 'award',
        gradientColors: AppColors.secondaryGradient,
      ),
      Program(
        id: '3',
        title: 'UI/UX Design',
        description: 'Design beautiful mobile apps.',
        duration: '4h 15m',
        status: 'pending',
        level: 'intermediate',
        icon: 'design',
        gradientColors: AppColors.purpleGradient,
      ),
    ];
  }
}
