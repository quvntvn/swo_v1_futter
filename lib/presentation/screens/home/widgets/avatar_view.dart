import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/screens/walking/walking_screen.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 16 / 12,
        child: Container(
          color: AppTheme.darkBackgroundColor,
          child: Stack(
            children: [
              const Center(
                child: Text('Avatar qui marche sur fond généré',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: TextButton.icon(
                  // MODIFIÉ : Ajout d'une icône
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    minimumSize: Size.zero,
                  ),
                  // MODIFIÉ : Ajout de la navigation vers le nouvel écran
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WalkingScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.fullscreen, size: 16),
                  label: const Text('Plein écran'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
