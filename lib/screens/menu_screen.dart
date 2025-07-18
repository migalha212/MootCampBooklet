import 'package:campbooklet/models/meals.dart';
import 'package:campbooklet/services/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/camp_data_provider.dart';
import '../widgets/meal_table.dart';
import '../widgets/string_day_selector.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final EmentaService _ementaService = EmentaService();
  List<MealDay> _allDays = [];
  MealDay? _selectedDay;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final pathId = Provider.of<CampDataProvider>(context, listen: false).pathId;
    if (pathId != null) {
      final days = await _ementaService.loadEmenta();
      setState(() {
        _allDays = days;
        _selectedDay = days.first;
      });
    }
  }

@override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedDay == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        StringDaySelector(
          availableDates: _allDays.map((e) => e.date).toList(),
          selectedDate: _selectedDay!.date,
          onDateSelected: (date) {
            final match = _allDays.firstWhere((e) => e.date == date);
            setState(() => _selectedDay = match);

            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.only(bottom: 24),
            children: _selectedDay!.meals
                .map((meal) => MealTable(meal: meal))
                .toList(),
          ),
        ),
      ],
    );
  }
}
