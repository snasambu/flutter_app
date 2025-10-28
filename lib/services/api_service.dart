import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/program.dart';

class ApiService {
  // Simulate API delay for realistic loading
  Future<void> _simulateDelay() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  // Fetch all programs
  Future<List<Program>> fetchPrograms() async {
    try {
      await _simulateDelay();
      
      final String response = await rootBundle.loadString('assets/data/programs.json');
      final data = json.decode(response);
      
      List<Program> programs = (data['programs'] as List)
          .map((programJson) => Program.fromJson(programJson))
          .toList();
      
      return programs;
    } catch (e) {
      throw Exception('Failed to load programs: $e');
    }
  }

  // Fetch programs by type
  Future<List<Program>> fetchProgramsByType(String type) async {
    try {
      final programs = await fetchPrograms();
      return programs.where((p) => p.type == type).toList();
    } catch (e) {
      throw Exception('Failed to filter programs: $e');
    }
  }

  // Fetch single program by ID
  Future<Program> fetchProgramById(int id) async {
    try {
      final programs = await fetchPrograms();
      return programs.firstWhere((p) => p.id == id);
    } catch (e) {
      throw Exception('Program not found: $e');
    }
  }

  // Submit application (mock)
  Future<bool> submitApplication(Map<String, dynamic> applicationData) async {
    try {
      await _simulateDelay();
      // In real app, this would POST to an API
      print('Application submitted: $applicationData');
      return true;
    } catch (e) {
      throw Exception('Failed to submit application: $e');
    }
  }

  // Submit feedback (mock)
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