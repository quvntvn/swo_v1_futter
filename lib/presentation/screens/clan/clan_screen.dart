import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/logic/cubits/clan_cubit.dart';
import 'package:stepworld_app/presentation/screens/clan/widgets/clan_dashboard_view.dart';
import 'package:stepworld_app/presentation/screens/clan/widgets/no_clan_view.dart';

class ClanScreen extends StatelessWidget {
  const ClanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // On utilise un BlocBuilder pour reconstruire l'UI quand l'état du clan change
      body: BlocBuilder<ClanCubit, ClanState>(
        builder: (context, state) {
          // Si le joueur a un clan, on affiche le tableau de bord
          if (state.myClan != null) {
            return ClanDashboardView(clan: state.myClan!);
          }
          // Sinon, on affiche l'écran pour en trouver un
          else {
            return NoClanView(discoverClans: state.discoverClans);
          }
        },
      ),
    );
  }
}
