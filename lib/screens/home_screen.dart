
import 'package:flutter/material.dart';

import 'exercise_catalog_screen.dart';
import 'workout_schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color _electricBlue = Color(0xFF38BDF8);
  static const Color _mutedText = Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FlexFit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Profil mahasiswa',
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Profil Mahasiswa'),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('I Putu Eka Bawa Utama'),
                      SizedBox(height: 8),
                      Text('NIM: 2415051008'),
                      Text('Kelas: PTI 5A'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 12, bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TRAIN YOUR WAY.',
                style: textTheme.labelMedium?.copyWith(
                  color: _electricBlue,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              // Workout utama
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Workout Pilihan',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.bolt, color: _electricBlue),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF0B1020),
                      Color(0xFF102957),
                      Color(0xFF1D4ED8),
                      Color(0xFF102957),
                      Color(0xFF0B1020),
                    ],
                    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.fitness_center,
                      color: Colors.white,
                      size: 36,
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      'FULL BODY WORKOUT',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Whole Body Skill Up',
                      style: textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(Icons.timer_outlined, color: _electricBlue,
                            size: 18),
                        SizedBox(width: 6),
                        Text(
                          '30 menit',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.local_fire_department_outlined,
                            color: _electricBlue, size: 18),
                        SizedBox(width: 6),
                        Text(
                          'Full Body',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: _electricBlue,
                          foregroundColor: const Color(0xFF0B1020),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const WorkoutScheduleScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Lihat Jadwal Latihan'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Kategori latihan
              Text(
                'Kategori Latihan',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 104,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _CategoryItem(
                      icon: Icons.accessibility_new,
                      label: 'Full Body',
                      selected: true,
                    ),
                    _CategoryItem(
                      icon: Icons.fitness_center,
                      label: 'Chest',
                    ),
                    _CategoryItem(
                      icon: Icons.sports_gymnastics,
                      label: 'Back',
                    ),
                    _CategoryItem(
                      icon: Icons.sports_martial_arts,
                      label: 'Legs',
                    ),
                    _CategoryItem(
                      icon: Icons.bolt,
                      label: 'Shoulders',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Menu utama
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jelajahi FlexFit',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.arrow_forward, color: _mutedText),
                ],
              ),
              const SizedBox(height: 14),
              _FeatureCard(
                icon: Icons.fitness_center,
                title: 'Katalog Latihan',
                subtitle: 'Temukan berbagai pilihan latihan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExerciseCatalogScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              _FeatureCard(
                icon: Icons.calendar_month,
                title: 'Jadwal Latihan',
                subtitle: 'Atur rencana latihanmu sendiri',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WorkoutScheduleScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'FLEXFIT • TRAIN YOUR WAY',
                  style: textTheme.labelSmall?.copyWith(
                    color: _mutedText,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  static const Color _blue = Color(0xFF2563EB);
  static const Color _electricBlue = Color(0xFF38BDF8);
  static const Color _surface = Color(0xFF171E30);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: selected ? _blue : _surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? _electricBlue : const Color(0xFF29344A),
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 27,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              color: selected ? _electricBlue : Colors.white70,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  static const Color _electricBlue = Color(0xFF38BDF8);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _electricBlue.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: _electricBlue),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: _electricBlue,
        ),
        onTap: onTap,
      ),
    );
  }
}
