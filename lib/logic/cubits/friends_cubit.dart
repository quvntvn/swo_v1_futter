import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/data/models/friend.dart';

part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  FriendsCubit() : super(const FriendsState());

  Future<void> loadFriends() async {
    emit(state.copyWith(status: FriendsStatus.loading));

    // SIMULATION: On charge une liste d'amis factice.
    await Future.delayed(const Duration(milliseconds: 400));

    final mockFriends = [
      const Friend(name: 'ShadowWalker', dailySteps: 15234, isOnline: true),
      const Friend(name: 'CyberRunner', dailySteps: 12876),
      const Friend(name: 'PixelPilgrim', dailySteps: 9854, isOnline: true),
      const Friend(name: 'NeonNinja', dailySteps: 7654),
      const Friend(name: 'DataDancer', dailySteps: 5432),
      const Friend(name: 'GlitchGhost', dailySteps: 2109, isOnline: true),
    ];

    // On trie la liste par nombre de pas décroissant
    mockFriends.sort((a, b) => b.dailySteps.compareTo(a.dailySteps));

    emit(state.copyWith(
      status: FriendsStatus.success,
      friends: mockFriends,
    ));
  }
}
