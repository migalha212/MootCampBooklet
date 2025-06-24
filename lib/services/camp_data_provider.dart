import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/camp_data.dart';
import 'theme_loader.dart';

class CampDataProvider extends ChangeNotifier {
  String? _pathId;
  CampData? _data;
  ThemeData? _theme;
  bool _isInitialized = false;

  String? get pathId => _pathId;
  CampData? get data => _data;
  ThemeData? get theme => _theme;
  bool get isInitialized => _isInitialized;

  Future<void> initialize(String? storedPathId) async {
    if (_isInitialized) return; // Prevent re-initialization

    String? _errorMessage = null; // Clear previous errors

    try {
      if (storedPathId != null) {
        await loadPath(storedPathId);
      }
    } catch (e) {
      _errorMessage = 'Initialization failed: $e';
      print('CampDataProvider Initialization Error: $_errorMessage');
      _pathId = null;
    } finally {
      _isInitialized = true;
      notifyListeners();
    }
  }

  Future<void> loadPath(String pathId) async {
    _pathId = pathId;

    // Load path-specific JSON
    final jsonStr = await rootBundle.loadString('assets/data/$pathId.json');
    final jsonMap = jsonDecode(jsonStr);

    // Load full camp data
    _data = CampData.fromJson(jsonMap);

    // Parse theme using the external service
    _theme = ThemeLoader.buildThemeFromJson(jsonMap['theme']);

    // Store selection for next launch
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedPath', pathId);

    notifyListeners();
  }

  Future<void> resetPath() async {
    _pathId = null;
    _data = null;
    _theme = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedPath');

    notifyListeners();
  }
}

