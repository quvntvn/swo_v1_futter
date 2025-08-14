import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class MainActionButtons extends StatelessWidget {
  const MainActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Historique'),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppTheme.darkBackgroundColor,
              foregroundColor: AppTheme.textColor,
            ),
            child: const Text('Compteur de pas',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppTheme.darkBackgroundColor,
              foregroundColor: AppTheme.textColor,
            ),
            child: const Text('Money du jeu',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
