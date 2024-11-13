// UserCustomNavBar

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Provider to handle the current index of the BottomNavigationBar
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class UserCustomNavBar extends ConsumerStatefulWidget {
  const UserCustomNavBar({Key? key}) : super(key: key);

  @override
  _UserCustomNavBarState createState() => _UserCustomNavBarState();
}

class _UserCustomNavBarState extends ConsumerState<UserCustomNavBar> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, ref, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Handles navigation and updating the selected index
  void _onItemTapped(BuildContext context, WidgetRef ref, int index) {
    ref.read(bottomNavIndexProvider.notifier).state = index;

    // Route navigation based on index
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/shop');
        break;
      case 2:
        context.go('/profile');
        break;
    }
  }
}
