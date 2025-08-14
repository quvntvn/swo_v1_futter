import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // On utilise une ListView pour afficher une longue liste de stats
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: 12, // Nombre de stats factices
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppTheme.darkBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Statistique N°${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text('Valeur',
                  style: TextStyle(color: AppTheme.subtleTextColor)),
            ],
          ),
        );
      },
    );
  }
}
