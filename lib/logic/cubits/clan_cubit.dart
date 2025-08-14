import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/data/models/clan.dart';

part 'clan_state.dart';

class ClanCubit extends Cubit<ClanState> {
  ClanCubit() : super(const ClanState()) {
    // On charge les clans à découvrir dès l'initialisation
    loadDiscoverClans();
  }

  // NOUVELLE MÉTHODE : Pour charger une liste de clans à rejoindre
  void loadDiscoverClans() {
    // Simulation d'un appel réseau
    const mockClans = [
      Clan(name: 'Les Marcheurs du Vide', members: [
        'Joueur A',
        'Joueur B',
        'Joueur C',
        'Joueur D',
        'Joueur E',
        'Joueur F',
        'Joueur G'
      ]),
      Clan(name: 'Ghost Byte United', members: [
        'Membre 1',
        'Membre 2',
        'Membre 3',
        'Membre 4',
        'Membre 5',
        'Membre 6',
        'Membre 7',
        'Membre 8'
      ]),
      Clan(name: 'Voltage Crew', members: [
        'User X',
        'User Y',
        'User Z',
        'User W',
        'User V',
        'User U',
        'User T'
      ]),
      Clan(name: 'Neon Pulse Runners', members: [
        'Runner 1',
        'Runner 2',
        'Runner 3',
        'Runner 4',
        'Runner 5',
        'Runner 6'
      ]),
    ];
    emit(state.copyWith(discoverClans: mockClans));
  }

  void createClan(String name) {
    final newClan =
        Clan(name: name, members: ['Vous', 'Joueur Alpha', 'Joueur Beta']);
    emit(state.copyWith(myClan: newClan));
  }

  void leaveClan() {
    // On doit utiliser `emit(state.copyWith(myClan: null))` pour que le Cubit accepte de mettre à jour l'état
    // en passant une valeur null. C'est une subtilité de `copyWith`.
    emit(ClanState(myClan: null, discoverClans: state.discoverClans));
  }
}
