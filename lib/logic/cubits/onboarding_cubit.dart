import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  // Dans une vraie app, on lirait cette valeur depuis SharedPreferences
  // pour savoir si l'utilisateur a déjà vu l'onboarding.
  OnboardingCubit()
      : super(const OnboardingState(hasCompletedOnboarding: false));

  void completeOnboarding() {
    // On sauvegarde le fait que l'utilisateur a terminé.
    emit(const OnboardingState(hasCompletedOnboarding: true));
  }
}
