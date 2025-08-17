import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class HomeHeader extends StatelessWidget {
  final bool isNightMode;
  const HomeHeader({super.key, this.isNightMode = false});

  @override
  Widget build(BuildContext context) {
    final textColor = isNightMode ? Colors.white : AppTheme.textColor;
    final clanColor = isNightMode ? Colors.white70 : AppTheme.primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LvL 12 Nom Joueur',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: textColor)),
            Text('Nom Clan',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: clanColor)),
          ],
        ),
        if (!isNightMode) // On n'affiche le bouton que si on n'est pas en mode nuit
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
      ],
    );
  }
}
