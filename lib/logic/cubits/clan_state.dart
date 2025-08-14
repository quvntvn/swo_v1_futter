part of 'clan_cubit.dart';

class ClanState extends Equatable {
  final Clan? myClan;
  final List<Clan> discoverClans; // NOUVEAU : Liste des clans à découvrir

  const ClanState({this.myClan, this.discoverClans = const []});

  ClanState copyWith({
    Clan? myClan,
    List<Clan>? discoverClans,
  }) {
    return ClanState(
      myClan: myClan ?? this.myClan,
      discoverClans: discoverClans ?? this.discoverClans,
    );
  }

  @override
  List<Object?> get props => [myClan, discoverClans];
}
