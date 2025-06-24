import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/camp_data_provider.dart';
import 'path_pick_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _resetPath(BuildContext context) async {
    final campProvider = Provider.of<CampDataProvider>(context, listen: false);
    await campProvider.resetPath();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const ChoosePathScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.refresh),
          label: const Text('Reset Path'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => _resetPath(context),
        ),
      ),
    );
  }
}
