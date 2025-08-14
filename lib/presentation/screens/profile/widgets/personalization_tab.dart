import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class PersonalizationTab extends StatelessWidget {
  const PersonalizationTab({super.key});

  @override
  Widget build(BuildContext context) {
    // On utilise une ListView pour que le contenu puisse défiler si besoin
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // --- Grand Avatar ---
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.darkBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Avatar gros plan',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // --- Liste déroulante ---
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: AppTheme.darkBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: 'Couvre-chefs', // Valeur par défaut
              isExpanded: true,
              items: <String>[
                'Couvre-chefs',
                'Hauts',
                'Pantalons',
                'Chaussures'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                // Logique pour changer la catégorie d'items affichée
              },
            ),
          ),
        ),
        const SizedBox(height: 16),

        // --- Grille d'items ---
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: 8, // Nombre d'items factices
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: AppTheme.darkBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text('Item ${index + 1}'),
              ),
            );
          },
        ),
      ],
    );
  }
}
