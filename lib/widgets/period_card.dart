import 'package:campbooklet/models/schedule_day.dart';
import 'package:flutter/material.dart';


class PeriodCard extends StatelessWidget {
  final String time;
  final SchedulePeriod period;
  final String? shortDescription;
  final Color color;
  final VoidCallback? onTap;

  const PeriodCard({
    super.key,
    required this.time,
    required this.period,
    this.shortDescription,
    required this.color,
    this.onTap,
  });

  bool get isClickable => period.id != null;

  @override
  Widget build(BuildContext context) {
    final bool isMinimal = !isClickable && period.responsibility == null;

    return GestureDetector(
      onTap: isClickable ? onTap : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isClickable ? color.withOpacity(0.1) : Colors.grey.shade100,
          border: Border.all(
            color: isClickable ? color : Colors.grey.shade300,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    period.label,
                    style: TextStyle(
                      fontSize: isMinimal ? 13 : 15,
                      fontWeight: isMinimal ? FontWeight.w400 : FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  if (period.responsibility != null && !isClickable)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        period.responsibility!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (!isMinimal && (shortDescription != null || isClickable))
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    shortDescription ?? '',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ),
            if (isClickable)
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
