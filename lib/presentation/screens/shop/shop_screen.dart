import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/logic/cubits/shop_cubit.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/home_header.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

import 'widgets/daily_item_grid.dart';
import 'widgets/premium_pass_card.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ShopCubit>().loadShop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ShopCubit, ShopState>(
          builder: (context, state) {
            if (state.status == ShopStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const HomeHeader(), // On réutilise le header de l'accueil
                const SizedBox(height: 20),
                _buildMoneyDisplay(context, state.userMoney),
                const SizedBox(height: 20),
                Text('Shop du jour :',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                DailyItemGrid(items: state.dailyItems),
                const SizedBox(height: 24),
                const PremiumPassCard(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMoneyDisplay(BuildContext context, int money) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppTheme.darkBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            money.toString(),
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppTheme.textColor,
                  fontSize: 32,
                ),
          ),
          Text(
            'Étoiles disponibles',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
