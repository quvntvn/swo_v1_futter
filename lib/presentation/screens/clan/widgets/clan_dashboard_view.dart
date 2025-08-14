import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/data/models/clan.dart';
import 'package:stepworld_app/logic/cubits/clan_cubit.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/home_header.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class ClanDashboardView extends StatelessWidget {
  final Clan clan;
  const ClanDashboardView({super.key, required this.clan});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const HomeHeader(),
          const SizedBox(height: 24),
          _buildClanHeader(context),
          const SizedBox(height: 16),
          _buildLeaderboardCard('Classement de la Guerre de Clan'),
          const SizedBox(height: 12),
          _buildLeaderboardCard('Classement des Membres du Clan'),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {/* TODO: Ouvrir le chat */},
            icon: const Icon(Icons.chat_bubble_outline),
            label: const Text('Ouvrir le Chat du Clan'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.darkBackgroundColor,
              foregroundColor: AppTheme.textColor,
            ),
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () => context.read<ClanCubit>().leaveClan(),
            icon:
                const Icon(Icons.exit_to_app, color: AppTheme.accentColorPulse),
            label: const Text('Quitter le clan',
                style: TextStyle(color: AppTheme.accentColorPulse)),
          )
        ],
      ),
    );
  }

  Widget _buildClanHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppTheme.darkBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(clan.name, style: Theme.of(context).textTheme.titleLarge),
          IconButton(
            onPressed: () {/* TODO: Afficher les infos du clan */},
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardCard(String title) {
    return Card(
      child: Container(
        height: 200,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.subtleTextColor),
          ),
        ),
      ),
    );
  }
}
