import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/data/models/clan.dart';
import 'package:stepworld_app/logic/cubits/clan_cubit.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class ClanScreen extends StatelessWidget {
  const ClanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clan')),
      body: BlocBuilder<ClanCubit, ClanState>(
        builder: (context, state) {
          if (state.myClan == null) {
            return _buildNoClanView(context);
          } else {
            return _buildClanView(context, state.myClan!);
          }
        },
      ),
    );
  }

  Widget _buildNoClanView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shield_outlined,
                size: 80, color: AppTheme.subtleTextColor),
            const SizedBox(height: 16),
            const Text('Vous n\'avez pas de clan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text(
              'Créez ou rejoignez un clan pour la compétition !',
              style: TextStyle(color: AppTheme.subtleTextColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () =>
                  context.read<ClanCubit>().createClan('Les Marcheurs du Vide'),
              child: const Text('Créer un clan (Simulation)'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClanView(BuildContext context, Clan clan) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(clan.name,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(color: AppTheme.primaryColor)),
                const SizedBox(height: 8),
                Text('${clan.members.length} / 10 Membres',
                    style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Membres', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        ...clan.members.map((member) => Card(
              child: ListTile(
                leading: const Icon(Icons.person_outline),
                title: Text(member),
              ),
            )),
        const SizedBox(height: 24),
        TextButton.icon(
          onPressed: () => context.read<ClanCubit>().leaveClan(),
          icon: const Icon(Icons.exit_to_app, color: AppTheme.accentColorPulse),
          label: const Text('Quitter le clan',
              style: TextStyle(color: AppTheme.accentColorPulse)),
        )
      ],
    );
  }
}
