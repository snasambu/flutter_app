class Program {
  final String id;
  final String title;
  final String company;
  final String? companyLogo;
  final String description;
  final String duration;
  final String? hoursPerWeek;
  final String type;
  final String difficulty;
  final String startDate;
  final String? applicationDeadline;
  final List<String> skills;
  final List<String>? requirements;
  final int maxParticipants;
  final int currentParticipants;
  final double? scholarship;
  final double? prizePool;

  Program({
    required this.id,
    required this.title,
    required this.company,
    required this.description,
    required this.duration,
    this.companyLogo,
    this.hoursPerWeek,
    required this.type,
    required this.difficulty,
    required this.startDate,
    this.applicationDeadline,
    required this.skills,
    this.requirements,
    required this.maxParticipants,
    required this.currentParticipants,
    this.scholarship,
    this.prizePool,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    // helpers to safely parse numbers
    int parseInt(dynamic v) {
      if (v is int) return v;
      if (v is String) return int.tryParse(v) ?? 0;
      if (v is double) return v.toInt();
      return 0;
    }

    double? parseDouble(dynamic v) {
      if (v == null) return null;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      if (v is String) return double.tryParse(v);
      return null;
    }

    List<String> parseStringList(dynamic v) {
      if (v == null) return <String>[];
      if (v is List) return v.map((e) => e.toString()).toList();
      return <String>[];
    }

    return Program(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      company: json['company']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      duration: json['duration']?.toString() ?? '',
      companyLogo: json['companyLogo']?.toString(),
      hoursPerWeek: json['hoursPerWeek']?.toString(),
      type: json['type']?.toString() ?? '',
      difficulty: json['difficulty']?.toString() ?? '',
      startDate: json['startDate']?.toString() ?? '',
      applicationDeadline: json['applicationDeadline']?.toString(),
      skills: parseStringList(json['skills']),
      requirements: json['requirements'] != null ? parseStringList(json['requirements']) : null,
      maxParticipants: parseInt(json['maxParticipants']),
      currentParticipants: parseInt(json['currentParticipants']),
      scholarship: parseDouble(json['scholarship']),
      prizePool: parseDouble(json['prizePool']),
    );
  }

  String get availableSpots {
    return '${maxParticipants - currentParticipants} spots left';
  }

  bool get isAlmostFull {
    return currentParticipants >= (maxParticipants * 0.8);
  }

  int get spotsRemaining {
    return maxParticipants - currentParticipants;
  }
}