import 'package:equatable/equatable.dart';

class Clan extends Equatable {
  final String name;
  final List<String> members;
  const Clan({required this.name, required this.members});

  @override
  List<Object> get props => [name, members];
}
