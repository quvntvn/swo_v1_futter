import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/logic/cubits/steps_cubit.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/chest_progress_bar.dart';
import 'package.stepworld_app/presentation/screens/home/widgets/daily_challenge_card.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/home_header.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class WalkingScreen extends StatelessWidget {
  const WalkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // On récupère l'état actuel des pas pour l'afficher
    final stepsState = context.watch<StepsCubit>().state;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // --- Header ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HomeHeader(),
                  // Bouton pour fermer le plein écran
                  IconButton(
                    icon: const Icon(Icons.close_fullscreen),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // --- Infos du haut ---
              ChestProgressBar(currentSteps: stepsState.todaySteps),
              const SizedBox(height: 8),
              const DailyChallengeCard(),

              // --- Avatar qui marche (prend tout l'espace restant) ---
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: AppTheme.darkBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Avatar qui marche sur fond généré',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              // --- Compteur de pas en bas ---
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // TODO: Afficher l'historique
                    },
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
                      child: Text(
                        '${stepsState.todaySteps} pas',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
