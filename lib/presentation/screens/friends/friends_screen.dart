import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepworld_app/logic/cubits/friends_cubit.dart';
import 'package:stepworld_app/presentation/screens/home/widgets/home_header.dart';
import 'package:stepworld_app/presentation/theme/app_theme.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  void initState() {
    super.initState();
    // On charge la liste d'amis au démarrage de l'écran
    context.read<FriendsCubit>().loadFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              Expanded(
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Classement des Amis',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: BlocBuilder<FriendsCubit, FriendsState>(
                          builder: (context, state) {
                            if (state.status == FriendsStatus.loading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return _buildFriendsList(state.friends);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Rechercher un ami...',
        filled: true,
        fillColor: AppTheme.darkBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {/* TODO: Logique de recherche */},
        ),
      ),
    );
  }

  Widget _buildFriendsList(List<dynamic> friends) {
    if (friends.isEmpty) {
      return const Center(child: Text("Vous n'avez pas encore d'amis."));
    }
    return ListView.separated(
      itemCount: friends.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final friend = friends[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.darkBackgroundColor,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppTheme.textColor),
            ),
          ),
          title: Text(friend.name),
          subtitle: Text('${friend.dailySteps} pas aujourd\'hui'),
          trailing: friend.isOnline
              ? const Icon(Icons.circle,
                  color: AppTheme.accentColorGhost, size: 12)
              : null,
        );
      },
    );
  }
}
