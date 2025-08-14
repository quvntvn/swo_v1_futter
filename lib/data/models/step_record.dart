import 'package:equatable/equatable.dart';

class StepRecord extends Equatable {
  final String date;
  final int steps;
  const StepRecord({required this.date, required this.steps});
  @override
  List<Object> get props => [date, steps];
}
