import 'package:campbooklet/models/meals.dart';
import 'package:flutter/material.dart';

class MealTable extends StatelessWidget {
  final Meal meal;

  const MealTable({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meal.type,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Table(
              border: TableBorder.all(color: Colors.grey.shade300),
              columnWidths: const {
                0: FixedColumnWidth(60),
                1: FixedColumnWidth(60),
                2: FlexColumnWidth(),
              },
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Color(0xFFECECEC)),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        "Qty",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        "Unit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        "Item",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ...meal.items.map((item) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(item.quantity.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(item.unit),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(item.item),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
