import 'package:flutter/material.dart';
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
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: Size.zero,
                  ),
                  onPressed: () {},
                  child: const Text('Plein écran'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
