import 'package:equatable/equatable.dart';

class Friend extends Equatable {
  final String name;
  final int dailySteps;
  final bool isOnline;

  const Friend({
    required this.name,
    required this.dailySteps,
    this.isOnline = false,
  });

  @override
  List<Object?> get props => [name, dailySteps, isOnline];
}
