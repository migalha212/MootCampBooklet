import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/camp_data_provider.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme =
        Provider.of<CampDataProvider>(context).theme ?? ThemeData.light();

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: theme.colorScheme.primary,
      unselectedItemColor: Colors.grey[600],
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: _navItems,
    );
  }

  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Menu'),
    BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule'),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'Info'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
}
