import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'services/camp_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final selectedPath = prefs.getString('selectedPath');

  runApp(
    ChangeNotifierProvider(
      create: (_) => CampDataProvider()..initialize(selectedPath),
      child: const App(),
    ),
  );
}
