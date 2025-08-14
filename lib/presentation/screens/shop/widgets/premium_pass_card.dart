import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class PremiumPassCard extends StatelessWidget {
  const PremiumPassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.darkBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Avantages du Pass Premium',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            _buildAdvantageRow(
                Icons.star, '+20% d\'étoiles sur tous les gains'),
            const SizedBox(height: 8),
            _buildAdvantageRow(Icons.ad_units_outlined, 'Aucune publicité'),
            const SizedBox(height: 8),
            _buildAdvantageRow(
                Icons.color_lens, 'Accès à des couleurs de pseudo exclusives'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppTheme.primaryColor,
              ),
              child: const Text('Abonnement Premium Ultra Deluxe'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAdvantageRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.accentColorGhost, size: 20),
        const SizedBox(width: 12),
        Expanded(child: Text(text)),
      ],
    );
  }
}
