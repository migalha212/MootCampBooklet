import 'package:campbooklet/models/activity.dart';
import 'package:campbooklet/screens/activity_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/schedule_day.dart';
import '../widgets/period_card.dart';
import '../services/camp_data_provider.dart';

class ScheduleDayView extends StatelessWidget {
  final ScheduleDay day;
  final Map<String, Activity> activitiesMap;

  const ScheduleDayView({super.key, required this.day, required this.activitiesMap});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<CampDataProvider>(context).theme!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: day.periods.entries.map((entry) {
            final time = entry.key;
            final period = entry.value;
            final shortDesc = period.id != null
          ? activitiesMap[period.id]?.shortDescription : null;
        
            return PeriodCard(
        time: time,
        period: period,
        shortDescription: shortDesc,
        color: theme.colorScheme.primary,
        onTap: period.id != null
            ? () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ActivityDetailScreen(activityId: period.id!),
                  ),
                )
            : null,
            );
          }).toList(),
        ),
      )
    );
  }
}
