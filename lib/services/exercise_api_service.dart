import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/exercise.dart';

class ExerciseApiService {
  static const String _baseUrl = 'https://wger.de/api/v2';

  final http.Client _client;

  ExerciseApiService({http.Client? client})
      : _client = client ?? http.Client();

  Future<List<Exercise>> fetchExercises({
    int limit = 20,
    int offset = 0,
  }) async {
    final uri = Uri.parse('$_baseUrl/exerciseinfo/').replace(
      queryParameters: {
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
    );

    final response = await _client.get(
      uri,
      headers: const {'Accept': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Gagal mengambil data latihan: HTTP ${response.statusCode}',
      );
    }

    final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    final List<dynamic> results = data['results'] as List<dynamic>;

    return results.map((item) {
      final json = item as Map<String, dynamic>;

      return Exercise(
        id: json['id'] as int?,
        name: _extractExerciseName(json),
        description: json['description'] as String? ?? '',
        muscleGroup: '',
        equipment: '',
        imageUrl: json['images'] is List &&
                (json['images'] as List).isNotEmpty
            ? ((json['images'] as List).first
                as Map<String, dynamic>)['image'] as String?
            : null,
      );
    }).toList();
  }

  void dispose() {
    _client.close();
  }
  String _extractExerciseName(Map<String, dynamic> json) {
  final translations = json['translations'];

  if (translations is List) {
    for (final item in translations) {
      if (item is Map<String, dynamic>) {
        final name = item['name'];

        if (name is String && name.trim().isNotEmpty) {
          return name;
        }
      }
    }
  }

  return json['name'] as String? ?? 'Latihan tanpa nama';
}
}
