class Exercise {
  final int? id;
  final String name;
  final String description;
  final String muscleGroup;
  final String equipment;
  final String? imageUrl;

  const Exercise({
    this.id,
    required this.name,
    required this.description,
    required this.muscleGroup,
    required this.equipment,
    this.imageUrl,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      muscleGroup: json['muscleGroup'] as String? ?? '',
      equipment: json['equipment'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'muscleGroup': muscleGroup,
      'equipment': equipment,
      'imageUrl': imageUrl,
    };
  }
}
