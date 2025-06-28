
import 'package:campbooklet/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/camp_data_provider.dart';
import '../widgets/day_selector.dart';
import '../widgets/schedule_view.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int selectedIndex = 0;

  
  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CampDataProvider>(context);
    final schedule = provider.data?.schedule ?? [];
    final Map<String, Activity> activities = provider.activitiesMap ?? {};
    if (schedule.isEmpty) {
      return const Center(child: Text('No schedule available.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        DaySelector(
          scheduleDays: schedule,
          selectedIndex: selectedIndex,
          onSelected: (i) => setState(() => selectedIndex = i),
        ),
        Expanded(child: ScheduleDayView(day: schedule[selectedIndex],activitiesMap: activities
        )),
      ],
    );
  }
}
