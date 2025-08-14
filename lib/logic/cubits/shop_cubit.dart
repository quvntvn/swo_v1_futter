import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/data/models/shop_item.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(const ShopState());

  Future<void> loadShop() async {
    emit(state.copyWith(status: ShopStatus.loading));

    // SIMULATION: On attend et on charge des données factices.
    await Future.delayed(const Duration(milliseconds: 300));

    const mockItems = [
      ShopItem(
          name: 'Casque Néo-Punk',
          price: 1500,
          type: ItemType.couvreChef,
          icon: Icons.headphones),
      ShopItem(
          name: 'Bonnet Holographique',
          price: 1200,
          type: ItemType.couvreChef,
          icon: Icons.ac_unit),
      ShopItem(
          name: 'Veste de Motard',
          price: 3000,
          type: ItemType.haut,
          icon: Icons.checkroom),
      ShopItem(
          name: 'T-shirt Spectral',
          price: 1000,
          type: ItemType.haut,
          icon: Icons.shopping_bag_outlined),
      ShopItem(
          name: 'Jean Renforcé',
          price: 2500,
          type: ItemType.pantalon,
          icon: Icons.accessibility),
      ShopItem(
          name: 'Jogging de Brume',
          price: 1800,
          type: ItemType.pantalon,
          icon: Icons.directions_run),
      ShopItem(
          name: 'Baskets à Lévitation',
          price: 5000,
          type: ItemType.chaussure,
          icon: Icons.rocket_launch_outlined),
      ShopItem(
          name: 'Bottes de Marche',
          price: 2200,
          type: ItemType.chaussure,
          icon: Icons.ice_skating_outlined),
    ];

    emit(state.copyWith(
      status: ShopStatus.success,
      dailyItems: mockItems,
      userMoney: 23500, // Argent factice de l'utilisateur
    ));
  }
}
