import 'package:flutter/material.dart';

class RulesList extends StatelessWidget {
  final List<String>? rules;
  final double verticalSpacing;

  const RulesList({
    super.key,
    required this.rules,
    required this.verticalSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (rules == null || rules!.isEmpty) {
      return const SizedBox.shrink(); // Don't display anything if no rules
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: verticalSpacing), // Initial spacing
        Text(
          'Rules',
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: verticalSpacing * 0.6), // Spacing below title
        ...rules!.asMap().entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              '${entry.key + 1}. ${entry.value}',
              style: TextStyle(fontSize: size.width * 0.038, height: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}
