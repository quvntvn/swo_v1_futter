import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class ChestProgressBar extends StatelessWidget {
  final int currentSteps;
  const ChestProgressBar({super.key, required this.currentSteps});

  @override
  Widget build(BuildContext context) {
    final double progress = min(currentSteps / 40000, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Progression des coffres quotidiens',
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: AppTheme.darkBackgroundColor,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppTheme.accentColorGhost),
          ),
        ),
      ],
    );
  }
}
