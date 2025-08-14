import 'package:flutter/material.dart';
import 'package:stepworld_app/data/models/shop_item.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class DailyItemGrid extends StatelessWidget {
  final List<ShopItem> items;
  const DailyItemGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5, // Ratio pour des boutons plus larges que hauts
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ElevatedButton(
          onPressed: () {
            // TODO: Logique d'achat
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.darkBackgroundColor,
              foregroundColor: AppTheme.textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
          child: Row(
            children: [
              Icon(item.icon, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
