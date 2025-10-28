// class Program {
//   final String id;
//   final String title;
//   final String description;
//   final String duration;

//   Program({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.duration,
//   });
// }

class Program {
  final int id;
  final String title;
  final String company;
  final String? companyLogo;
  final String duration;
  final String? hoursPerWeek;
  final String type;
  final String difficulty;
  final String startDate;
  final String? applicationDeadline;
  final String description;
  final List<String> skills;
  final int maxParticipants;
  final int currentParticipants;
  final double? scholarship;
  final List<String>? requirements;

  Program({
    required this.id,
    required this.title,
    required this.company,
    this.companyLogo,
    required this.duration,
    this.hoursPerWeek,
    required this.type,
    required this.difficulty,
    required this.startDate,
    this.applicationDeadline,
    required this.description,
    required this.skills,
    required this.maxParticipants,
    required this.currentParticipants,
    this.scholarship,
    this.requirements,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      companyLogo: json['companyLogo'],
      duration: json['duration'],
      hoursPerWeek: json['hoursPerWeek'],
      type: json['type'],
      difficulty: json['difficulty'],
      startDate: json['startDate'],
      applicationDeadline: json['applicationDeadline'],
      description: json['description'],
      skills: List<String>.from(json['skills']),
      maxParticipants: json['maxParticipants'],
      currentParticipants: json['currentParticipants'],
      scholarship: json['scholarship']?.toDouble(),
      requirements: json['requirements'] != null 
          ? List<String>.from(json['requirements'])
          : null,
    );
  }

  String get availableSpots {
    return '${maxParticipants - currentParticipants} spots left';
  }

  bool get isAlmostFull {
    return currentParticipants >= (maxParticipants * 0.8);
  }
}