import 'dart:convert';
import 'package:campbooklet/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/camp_data.dart';
import 'theme_loader.dart';

class CampDataProvider extends ChangeNotifier {
  String? _pathId;
  Map<String, Activity>? _activitiesMap;
  CampData? _data;
  ThemeData? _theme;
  bool _isInitialized = false;
  String? _errorMessage;

  String? get pathId => _pathId;
   Map<String, Activity>? get activitiesMap => _activitiesMap;
  CampData? get data => _data;
  ThemeData? get theme => _theme;
  bool get isInitialized => _isInitialized;
  String? get errorMessage => _errorMessage;

  Future<void> initialize(String? storedPathId) async {
    if (_isInitialized) {
      print(
        'CampDataProvider: Already initialized. Skipping re-initialization.',
      );
      return;
    }

    _errorMessage = null;
    print('CampDataProvider: Initializing with storedPathId: $storedPathId');

    try {
      await _loadActivitiesMap();
      if (storedPathId != null) {
        await loadPath(storedPathId);
      }
    } catch (e) {
      _errorMessage = 'Initialization failed: $e';
      print('CampDataProvider Initialization Error: $_errorMessage');
      _pathId = null;
      _data = null;
      _theme = null;
    } finally {
      _isInitialized = true;
      print(
        'CampDataProvider: Initialization complete. '
        'pathId: $_pathId, isInitialized: $_isInitialized, errorMessage: $_errorMessage',
      );
      notifyListeners();
    }
  }

Future<void> _loadActivitiesMap() async {
    try {
      final jsonStr = await rootBundle.loadString(
        'assets/data/activities.json',
      );
      final List<dynamic> jsonData = jsonDecode(jsonStr);
      final List<Activity> activitiesList = jsonData
          .map((e) => Activity.fromJsonId(e))
          .toList();

      _activitiesMap = {
        for (var activity in activitiesList) activity.id: activity,
      };
      print('CampDataProvider: Successfully loaded activities map.');
    } on FlutterError catch (e) {
      _errorMessage = 'Failed to load activities.json: ${e.message}';
      print('CampDataProvider ERROR (Activities Loading): $_errorMessage');
      _activitiesMap = null;
      rethrow; 
    } on FormatException catch (e) {
      _errorMessage = 'Invalid JSON format for activities.json: ${e.message}';
      print('CampDataProvider ERROR (Activities Parsing): $_errorMessage');
      _activitiesMap = null;
      rethrow;
    } catch (e) {
      _errorMessage =
          'An unexpected error occurred while loading activities: $e';
      print('CampDataProvider ERROR (Activities General): $_errorMessage');
      _activitiesMap = null;
      rethrow;
    }
  }

  Future<void> loadPath(String newPathId) async {
    _errorMessage = null;
    print('CampDataProvider: Attempting to load path: $newPathId');

    try {
      final jsonStr = await rootBundle.loadString(
        'assets/data/$newPathId.json',
      );
      final jsonMap = jsonDecode(jsonStr);

      _data = CampData.fromJson(jsonMap);

      _theme = ThemeLoader.buildThemeFromJson(jsonMap['theme']);

      _pathId = newPathId;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedPath', newPathId);

      print('CampDataProvider: Successfully loaded path: $_pathId');
    } on FlutterError catch (e) {
      _errorMessage =
          'Failed to load asset data for "$newPathId.json": ${e.message}';
      print('CampDataProvider ERROR (Asset Loading): $_errorMessage');
      _pathId = null;
      _data = null;
      _theme = null;
    } on FormatException catch (e) {
      _errorMessage = 'Invalid JSON format for "$newPathId.json": ${e.message}';
      print('CampDataProvider ERROR (JSON Parsing): $_errorMessage');
      _pathId = null;
      _data = null;
      _theme = null;
    } catch (e) {
      _errorMessage =
          'An unexpected error occurred while processing path "$newPathId": $e';
      print('CampDataProvider ERROR (General): $_errorMessage');
      _pathId = null;
      _data = null;
      _theme = null;
    } finally {
      print(
        'CampDataProvider: loadPath finished for "$newPathId". Current pathId: $_pathId, Error: $_errorMessage',
      );
      notifyListeners();
    }
  }

  Future<void> resetPath() async {
    _errorMessage = null;
    _pathId = null;
    _data = null;
    _theme = null;
    _isInitialized = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedPath');

    print('CampDataProvider: Path has been reset. Re-initializing...');
    await initialize(null);
  }
}
