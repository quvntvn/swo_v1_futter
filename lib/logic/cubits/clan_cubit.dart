import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/data/models/clan.dart';

part 'clan_state.dart';

class ClanCubit extends Cubit<ClanState> {
  ClanCubit() : super(const ClanState());

  void createClan(String name) {
    // Simule la création et l'ajout de quelques membres
    final newClan =
        Clan(name: name, members: ['Vous', 'Joueur Alpha', 'Joueur Beta']);
    emit(state.copyWith(myClan: newClan));
  }

  void leaveClan() {
    emit(const ClanState(myClan: null));
  }
}
