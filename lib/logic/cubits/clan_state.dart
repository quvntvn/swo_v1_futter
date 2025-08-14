part of 'clan_cubit.dart';

class ClanState extends Equatable {
  final Clan? myClan;
  const ClanState({this.myClan});

  ClanState copyWith({Clan? myClan}) {
    return ClanState(myClan: myClan ?? this.myClan);
  }

  @override
  List<Object?> get props => [myClan];
}
