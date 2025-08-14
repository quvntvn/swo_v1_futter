import 'package:flutter/material.dart';
import 'package:stepworld_app/presentation/common_widgets/placeholder_screen.dart';
import 'package:stepworld_app/presentation/screens/clan/clan_screen.dart';
import 'package:stepworld_app/presentation/screens/home/home_screen.dart';
import 'package:stepworld_app/presentation/screens/profile/profile_screen.dart';
import 'package:stepworld_app/presentation/screens/shop/shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;

  // CORRECTION : On a retiré "const" de cette ligne
  static final List<Widget> _widgetOptions = <Widget>[
    const PlaceholderScreen(title: 'Amis'),
    const ClanScreen(),
    const HomeScreen(),
    const ShopScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Amis'),
          BottomNavigationBarItem(icon: Icon(Icons.shield), label: 'Clan'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
