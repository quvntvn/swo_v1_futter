part of 'steps_cubit.dart';

enum StepsStatus { initial, loading, success, failure }

class StepsState extends Equatable {
  final StepsStatus status;
  final int todaySteps;
  final int totalSteps;
  final List<StepRecord> history;

  const StepsState({
    this.status = StepsStatus.initial,
    this.todaySteps = 0,
    this.totalSteps = 0,
    this.history = const [],
  });

  StepsState copyWith({
    StepsStatus? status,
    int? todaySteps,
    int? totalSteps,
    List<StepRecord>? history,
  }) {
    return StepsState(
      status: status ?? this.status,
      todaySteps: todaySteps ?? this.todaySteps,
      totalSteps: totalSteps ?? this.totalSteps,
      history: history ?? this.history,
    );
  }

  @override
  List<Object> get props => [status, todaySteps, totalSteps, history];
}
