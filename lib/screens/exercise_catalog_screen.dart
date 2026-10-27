
import 'package:flutter/material.dart';

class ExerciseCatalogScreen extends StatelessWidget {
  const ExerciseCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Latihan'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.fitness_center, size: 64),
            SizedBox(height: 16),
            Text(
              'Katalog Latihan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('Daftar latihan akan ditampilkan di sini.'),
          ],
        ),
      ),
    );
  }
}
