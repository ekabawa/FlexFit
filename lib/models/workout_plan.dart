class WorkoutPlan {
  final String? id;
  final String name;
  final String description;
  final List<int> exerciseIds;
  final DateTime createdAt;

  const WorkoutPlan({
    this.id,
    required this.name,
    required this.description,
    this.exerciseIds = const [],
    required this.createdAt,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      id: json['id']?.toString(),
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      exerciseIds: (json['exerciseIds'] as List<dynamic>?)
              ?.map((item) => item as int)
              .toList() ??
          const [],
      createdAt: DateTime.tryParse(
            json['createdAt'] as String? ?? '',
          ) ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'exerciseIds': exerciseIds,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
