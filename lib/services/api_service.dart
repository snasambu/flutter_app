import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program.dart';

class ApiService {
  // Simulate network delay for realistic loading experience
  Future<void> _simulateDelay() async {
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  /// Fetch all programs from JSON file
  Future<List<Program>> fetchPrograms() async {
    try {
      // Simulate API loading
      await _simulateDelay();
      
      // Load JSON file from assets
      final String response = await rootBundle.loadString('assets/data/programs.json');
      
      // Parse JSON
      final Map<String, dynamic> data = json.decode(response);
      
      // Convert to List of Program objects
      final List<Program> programs = (data['programs'] as List)
          .map((programJson) => Program.fromJson(programJson))
          .toList();
      
      return programs;
    } catch (e) {
      throw Exception('Failed to load programs: $e');
    }
  }

  /// Fetch single program by ID
  Future<Program> fetchProgramById(String id) async {
    try {
      final programs = await fetchPrograms();
      return programs.firstWhere(
        (program) => program.id == id,
        orElse: () => throw Exception('Program not found'),
      );
    } catch (e) {
      throw Exception('Failed to load program: $e');
    }
  }

  /// Filter programs by type
  Future<List<Program>> fetchProgramsByType(String type) async {
    try {
      final programs = await fetchPrograms();
      return programs
          .where((program) => program.type.toLowerCase() == type.toLowerCase())
          .toList();
    } catch (e) {
      throw Exception('Failed to filter programs: $e');
    }
  }

  /// Submit application (mock submission)
  Future<bool> submitApplication(Map<String, dynamic> applicationData) async {
    try {
      await _simulateDelay();
      // In real app, this would POST to an API
      // For now, just simulate success
      print('Application submitted: $applicationData');
      return true;
    } catch (e) {
      throw Exception('Failed to submit application: $e');
    }
  }

  /// Submit feedback (mock submission)
  Future<bool> submitFeedback(Map<String, dynamic> feedbackData) async {
    try {
      await _simulateDelay();
      // In real app, this would POST to an API
      print('Feedback submitted: $feedbackData');
      return true;
    } catch (e) {
      throw Exception('Failed to submit feedback: $e');
    }
  }
}