import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class OnboardingPageTemplate extends StatelessWidget {
  final int pageNumber;
  final String title;
  final String explanation;
  final Widget content;

  const OnboardingPageTemplate({
    super.key,
    required this.pageNumber,
    required this.title,
    required this.explanation,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            // --- Header ---
            Text(
              'Première connexion $pageNumber/4',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 48),

            // --- Titre et explication ---
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 32),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              explanation,
              style: const TextStyle(
                  color: AppTheme.subtleTextColor, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),

            // --- Contenu spécifique à la page ---
            Expanded(
              child: Center(child: content),
            ),
          ],
        ),
      ),
    );
  }
}
