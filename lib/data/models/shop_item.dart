import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ItemType { couvreChef, haut, pantalon, chaussure }

class ShopItem extends Equatable {
  final String name;
  final int price;
  final ItemType type;
  final IconData icon; // On utilise une icône pour la simulation

  const ShopItem({
    required this.name,
    required this.price,
    required this.type,
    required this.icon,
  });

  @override
  List<Object?> get props => [name, price, type];
}
