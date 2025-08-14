import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/logic/cubits/onboarding_cubit.dart';
import 'package:stepworld_app/presentation/screens/onboarding/widgets/onboarding_page_template.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          // --- Page 1 ---
          OnboardingPageTemplate(
            pageNumber: 1,
            title: 'Connexion à Google',
            explanation:
                'Connectez votre compte Google pour sauvegarder votre progression et jouer avec vos amis en toute sécurité.',
            content: ElevatedButton(
              onPressed: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
              child: const Text('Connexion Google'),
            ),
          ),
          // --- Page 2 ---
          OnboardingPageTemplate(
            pageNumber: 2,
            title: 'Connexion à l\'application de pas',
            explanation:
                'Autorisez Stepworld à accéder à vos données de pas (Google Fit, Apple Health) pour transformer votre activité physique en ressource de jeu.',
            content: ElevatedButton(
              onPressed: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
              child: const Text('Connexion Pas'),
            ),
          ),
          // --- Page 3 ---
          OnboardingPageTemplate(
            pageNumber: 3,
            title: 'Principe de l\'application',
            explanation:
                'Chaque pas que vous faites dans la vie réelle vous rapporte des étoiles. Utilisez-les pour progresser, personnaliser votre avatar et dominer la compétition avec votre clan !',
            content: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppTheme.darkBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.directions_walk,
                      size: 80, color: AppTheme.subtleTextColor),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn),
                  child: const Text('Suivant'),
                ),
              ],
            ),
          ),
          // --- Page 4 ---
          OnboardingPageTemplate(
            pageNumber: 4,
            title: 'Choix du nom de joueur',
            explanation:
                'Choisissez un pseudo unique qui vous représentera dans le monde de Stepworld. Soyez créatif !',
            content: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Pseudo',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // C'est la fin, on marque l'onboarding comme terminé
                    context.read<OnboardingCubit>().completeOnboarding();
                  },
                  child: const Text('Commencer l\'aventure'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
