import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/home_header.dart';
import 'package:stepworld_app/presentation/screens/profile/widgets/personalization_tab.dart';
import 'package:stepworld_app/presentation/screens/profile/widgets/stats_tab.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DefaultTabController gère l'état des onglets pour nous.
    return DefaultTabController(
      length: 2, // Nous avons 2 onglets
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const HomeHeader(), // On réutilise le header
                        const SizedBox(height: 20),
                        // Voici la barre d'onglets
                        TabBar(
                          indicatorColor: Theme.of(context).primaryColor,
                          labelColor: Theme.of(context).primaryColor,
                          unselectedLabelColor: Colors.grey,
                          tabs: const [
                            Tab(text: 'Personnalisation'),
                            Tab(text: 'Statistiques'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            // Le contenu de l'onglet sélectionné s'affiche ici
            body: const TabBarView(
              children: [
                PersonalizationTab(),
                StatsTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
