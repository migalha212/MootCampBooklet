import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/schedule_day.dart';
import '../services/camp_data_provider.dart';

class DaySelector extends StatelessWidget {
  final List<ScheduleDay> scheduleDays;
  final int selectedIndex;
  final Function(int) onSelected;

  const DaySelector({
    super.key,
    required this.scheduleDays,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<CampDataProvider>(context).theme!;
    final primary = theme.colorScheme.primary;

    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: scheduleDays.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final day = scheduleDays[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? primary : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  DateFormat('EEE, d MMM').format(day.date),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
