import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/logic/cubits/steps_cubit.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/avatar_view.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/chest_progress_bar.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/daily_challenge_card.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/home_header.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/leaderboard_cards.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/main_action_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StepsCubit>().loadSteps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<StepsCubit, StepsState>(
          builder: (context, state) {
            if (state.status == StepsStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const HomeHeader(),
                const SizedBox(height: 20),
                const MainActionButtons(),
                const SizedBox(height: 20),
                ChestProgressBar(currentSteps: state.todaySteps),
                const SizedBox(height: 8),
                const DailyChallengeCard(),
                const SizedBox(height: 20),
                const LeaderboardCards(),
                const SizedBox(height: 20),
                const AvatarView(),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Rejoindre des amis'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
