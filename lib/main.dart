import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/logic/cubits/auth_cubit.dart';
import 'package:stepworld_app/logic/cubits/clan_cubit.dart';
import 'package:stepworld_app/logic/cubits/shop_cubit.dart'; // <-- AJOUTER CET IMPORT
import 'package:stepworld_app/logic/cubits/steps_cubit.dart';
import 'package:stepworld_app/presentation/common_widgets/auth_wrapper.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';
import 'package:stepworld_app/logic/cubits/friends_cubit.dart';
import 'package:stepworld_app/logic/cubits/onboarding_cubit.dart';

void main() {
  runApp(const StepworldApp());
}

class StepworldApp extends StatelessWidget {
  const StepworldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => OnboardingCubit()),
        BlocProvider(create: (_) => StepsCubit()),
        BlocProvider(create: (_) => ClanCubit()),
        BlocProvider(create: (_) => ShopCubit()), // <-- AJOUTER LE SHOPCUBIT
        BlocProvider(
            create: (_) => FriendsCubit()), // <-- AJOUTER LE FRIENDSCUBIT
      ],
      child: MaterialApp(
        title: 'Stepworld Online',
        theme: AppTheme.theme,
        home: const AuthWrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
