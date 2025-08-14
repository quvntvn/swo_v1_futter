import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LvL 12 Nom Joueur',
                style: Theme.of(context).textTheme.titleLarge),
            Text('Nom Clan',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppTheme.primaryColor)),
          ],
        ),
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
