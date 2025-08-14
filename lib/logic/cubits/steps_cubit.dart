import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/data/models/step_record.dart';

part 'steps_state.dart';

class StepsCubit extends Cubit<StepsState> {
  StepsCubit() : super(const StepsState());

  Future<void> loadSteps() async {
    emit(state.copyWith(status: StepsStatus.loading));
    // SIMULATION: Dans une vraie app, on lirait les données de Google Fit / HealthKit
    // et de la base de données (Firestore/DynamoDB).
    await Future.delayed(const Duration(milliseconds: 500));
    final mockHistory = [
      const StepRecord(date: 'Hier', steps: 8432),
      const StepRecord(date: 'Avant-hier', steps: 12051),
      const StepRecord(date: 'Il y a 3 jours', steps: 5234),
    ];
    emit(state.copyWith(
      status: StepsStatus.success,
      todaySteps: state.todaySteps, // On garde les pas du jour actuels
      history: mockHistory,
    ));
  }

  void addSteps(int newSteps) {
    emit(state.copyWith(
      todaySteps: state.todaySteps + newSteps,
      totalSteps: state.totalSteps + newSteps,
    ));
  }
}
