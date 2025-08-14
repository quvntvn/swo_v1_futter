import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/data/models/clan.dart';
import 'package:stepworld_app/logic/cubits/clan_cubit.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/home_header.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class NoClanView extends StatelessWidget {
  final List<Clan> discoverClans;
  const NoClanView({super.key, required this.discoverClans});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const HomeHeader(),
          const SizedBox(height: 24),
          Text(
            'Un clan vous permet de faire équipe avec d\'autres joueurs pour participer à des guerres de pas hebdomadaires et gagner des récompenses exclusives.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Simule la création d'un clan
              context.read<ClanCubit>().createClan('Les Conquérants');
            },
            child: const Text('Créer mon clan'),
          ),
          const SizedBox(height: 24),
          _buildSearchBar(),
          const SizedBox(height: 16),
          Text(
            'Clans à découvrir',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          // La liste des clans
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: discoverClans.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final clan = discoverClans[index];
              return Card(
                color: AppTheme.darkBackgroundColor,
                child: ListTile(
                  leading: const Icon(Icons.shield_outlined),
                  title: Text(clan.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${clan.members.length} / 10 membres'),
                  trailing: TextButton(
                    onPressed: () {/* TODO: Logique pour rejoindre */},
                    child: const Text('Rejoindre'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Rechercher un clan...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: AppTheme.darkBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
