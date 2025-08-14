part of 'friends_cubit.dart';

enum FriendsStatus { initial, loading, success, failure }

class FriendsState extends Equatable {
  final FriendsStatus status;
  final List<Friend> friends;

  const FriendsState({
    this.status = FriendsStatus.initial,
    this.friends = const [],
  });

  FriendsState copyWith({
    FriendsStatus? status,
    List<Friend>? friends,
  }) {
    return FriendsState(
      status: status ?? this.status,
      friends: friends ?? this.friends,
    );
  }

  @override
  List<Object> get props => [status, friends];
}
