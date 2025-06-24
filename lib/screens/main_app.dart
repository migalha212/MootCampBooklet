import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import 'home_screen.dart';
import 'schedule_screen.dart';
import 'story_screen.dart';
import 'contacts_screen.dart';
import 'rules_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _index = 2; // Start at Story

  final List<Widget> _pages = const [
    HomeScreen(),
    ScheduleScreen(),
    StoryScreen(),
    ContactsScreen(),
    RulesScreen(),
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
