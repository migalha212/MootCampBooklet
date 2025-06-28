import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/camp_data_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _resetPath(BuildContext context) async {
    final campProvider = Provider.of<CampDataProvider>(context, listen: false);
    await campProvider.resetPath();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          // Use a Column to place widgets vertically
          mainAxisSize: MainAxisSize.min, // Make Column take minimum space
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh, color: Colors.white,),
              label: const Text('Select another Path', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () => _resetPath(context),
            ),
            const SizedBox(height: 30),
            const Text(
              'This is an unofficial application created by the path\'s path leaders. '
              'The information provided is based on the respective path\'s camp booklet, serving as a digital companion for attendees.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54, // Subdued color
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
