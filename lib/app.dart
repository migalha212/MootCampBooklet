import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/path_pick_screen.dart';
import 'screens/main_app.dart';
import 'services/camp_data_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final campProvider = Provider.of<CampDataProvider>(context);

    return MaterialApp(
      title: 'Camp App',
      theme: campProvider.theme ?? ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: campProvider.isInitialized
          ? campProvider.pathId != null
                ? const MainApp()
                : const ChoosePathScreen()
          : const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
