import 'package:campbooklet/models/activity.dart';
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
    final primary = theme.colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PeriodCard(
            label: "Morning",
            period: day.periods["morning"],
            activity: activitiesMap[day.periods["morning"]?.id],
            color: primary,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          PeriodCard(
            label: "Afternoon",
            period: day.periods["afternoon"],
            activity: activitiesMap[day.periods["afternoon"]?.id],
            color: primary,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          PeriodCard(
            label: "Night",
            period: day.periods["night"],
            activity: activitiesMap[day.periods["night"]?.id],
            color: primary,
          ),
        ],
      ),
    );
  }
}
