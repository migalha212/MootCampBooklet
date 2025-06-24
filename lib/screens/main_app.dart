import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import 'menu_screen.dart';
import 'schedule_screen.dart';
import 'home_screen.dart';
import 'info_screen.dart';
import 'settings_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _index = 2;

  final List<Widget> _pages = const [
    MenuScreen(), // Ementa
    ScheduleScreen(), // Schedule
    HomeScreen(), // Story
    InfoScreen(), // Contacts + Rules
    SettingsScreen(), // Path reset, app info, etc.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
