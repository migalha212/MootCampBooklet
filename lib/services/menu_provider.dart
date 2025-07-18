import 'dart:convert';
import 'package:campbooklet/models/meals.dart';
import 'package:flutter/services.dart';


class EmentaService {
  Future<List<MealDay>> loadEmenta() async {
    final jsonStr = await rootBundle.loadString('assets/data/meals.json');
    final List data = json.decode(jsonStr)['meals'];
    return data.map((e) => MealDay.fromJson(e)).toList();
  }
}