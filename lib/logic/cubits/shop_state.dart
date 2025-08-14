part of 'shop_cubit.dart';

enum ShopStatus { initial, loading, success, failure }

class ShopState extends Equatable {
  final ShopStatus status;
  final List<ShopItem> dailyItems;
  final int userMoney;

  const ShopState({
    this.status = ShopStatus.initial,
    this.dailyItems = const [],
    this.userMoney = 0,
  });

  ShopState copyWith({
    ShopStatus? status,
    List<ShopItem>? dailyItems,
    int? userMoney,
  }) {
    return ShopState(
      status: status ?? this.status,
      dailyItems: dailyItems ?? this.dailyItems,
      userMoney: userMoney ?? this.userMoney,
    );
  }

  @override
  List<Object> get props => [status, dailyItems, userMoney];
}
