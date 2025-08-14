import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/logic/cubits/auth_cubit.dart';
import 'package:stepworld_app/logic/cubits/onboarding_cubit.dart';
import 'package:stepworld_app/presentation/screens/auth/login_screen.dart';
import 'package:stepworld_app/presentation/screens/main_screen.dart';
import 'package:stepworld_app/presentation/screens/onboarding/onboarding_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // On écoute l'état d'authentification ET l'état de l'onboarding
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        if (authState is Authenticated) {
          // Si l'utilisateur est connecté, on vérifie l'onboarding
          return BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, onboardingState) {
              if (onboardingState.hasCompletedOnboarding) {
                // Si l'onboarding est terminé, on va à l'écran principal
                return const MainScreen();
              } else {
                // Sinon, on montre l'onboarding
                return const OnboardingScreen();
              }
            },
          );
        } else {
          // Si pas connecté, on montre l'écran de connexion
          return const LoginScreen();
        }
      },
    );
  }
}
