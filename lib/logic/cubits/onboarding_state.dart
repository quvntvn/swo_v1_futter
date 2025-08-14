part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final bool hasCompletedOnboarding;

  const OnboardingState({this.hasCompletedOnboarding = false});

  @override
  List<Object> get props => [hasCompletedOnboarding];
}
