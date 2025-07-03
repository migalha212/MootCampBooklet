import 'package:campbooklet/models/activity.dart';
import 'package:campbooklet/screens/activity_details_screen.dart';
import 'package:flutter/material.dart';
import '../models/schedule_day.dart';

class PeriodCard extends StatelessWidget {
  final String label;
  final ActivityPeriod? period;
  final Activity? activity;
  final Color color;
  const PeriodCard({
    super.key,
    required this.label,
    required this.period,
    required this.activity,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (period == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        print('Tapped on period: ${activity?.id} - ${period!.label}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                ActivityDetailScreen(activityId: activity?.id ?? ''),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        height: MediaQuery.of(context).size.height * 0.15,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    period!.label,
                    maxLines: 3,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: color,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  activity?.shortDescription ?? 'No description available',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
