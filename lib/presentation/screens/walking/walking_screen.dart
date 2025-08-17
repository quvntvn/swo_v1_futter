import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:stepworld_app/logic/cubits/steps_cubit.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/chest_progress_bar.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/daily_challenge_card.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/home_header.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class WalkingScreen extends StatefulWidget {
  const WalkingScreen({super.key});

  @override
  State<WalkingScreen> createState() => _WalkingScreenState();
}

class _WalkingScreenState extends State<WalkingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _stepTimer;

  @override
  void initState() {
    super.initState();
    // Le contrôleur d'animation qui va tourner en boucle
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();

    // On simule l'ajout de pas toutes les 2 secondes pour voir l'avatar bouger
    _stepTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        context.read<StepsCubit>().addSteps(10 + Random().nextInt(20));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _stepTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stepsState = context.watch<StepsCubit>().state;

    return Scaffold(
      backgroundColor: const Color(0xff1e293b), // Fond de nuit
      body: Stack(
        children: [
          // --- EFFET DE PARALLAXE ---
          // On anime la position du fond en fonction du contrôleur
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: [
                  // Calque 1 : Le fond lointain (bouge lentement)
                  _buildParallaxLayer(
                    'assets/background_far.png', // Remplacez par vos images
                    _controller.value * 0.1,
                    const Color(0xff0f172a),
                  ),
                  // Calque 2 : Les bâtiments du milieu (vitesse moyenne)
                  _buildParallaxLayer(
                    'assets/background_mid.png',
                    _controller.value * 0.4,
                    const Color(0xff334155),
                  ),
                  // Calque 3 : Le sol (bouge vite)
                  _buildParallaxLayer(
                    'assets/foreground.png',
                    _controller.value * 1.0,
                    const Color(0xff475569),
                  ),
                ],
              );
            },
          ),

          // --- AVATAR ---
          Align(
            alignment: const Alignment(0, 0.7), // Positionné en bas au centre
            child: _buildAvatar(),
          ),

          // --- INTERFACE UTILISATEUR ---
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: HomeHeader(isNightMode: true)),
                      IconButton(
                        icon: const Icon(Icons.close_fullscreen,
                            color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ChestProgressBar(currentSteps: stepsState.todaySteps),
                  const SizedBox(height: 8),
                  const DailyChallengeCard(),
                  const Spacer(), // Pousse le compteur en bas
                  _buildBottomStepCounter(stepsState.todaySteps),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget pour construire un calque du parallaxe
  Widget _buildParallaxLayer(
      String imagePath, double offset, Color placeholderColor) {
    // La largeur est 2x celle de l'écran pour permettre le défilement
    final screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      left: -screenWidth + (offset * screenWidth),
      bottom: 0,
      height: MediaQuery.of(context).size.height,
      width: screenWidth * 2,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        // Si l'image n'existe pas, on affiche un conteneur coloré
        errorBuilder: (context, error, stackTrace) {
          return Container(color: placeholderColor);
        },
      ),
    );
  }

  // Widget pour l'avatar (avec une petite animation de balancement)
  Widget _buildAvatar() {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: -0.05, end: 0.05),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value,
          child: child,
        );
      },
      child: Container(
        width: 80,
        height: 120,
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.person, size: 60, color: Colors.white),
      ),
    );
  }

  // Widget pour le compteur de pas en bas
  Widget _buildBottomStepCounter(int steps) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          child: const Text('Historique'),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.black.withOpacity(0.3),
              foregroundColor: Colors.white,
            ),
            child: Text(
              '$steps pas',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
