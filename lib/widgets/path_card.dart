import 'package:flutter/material.dart';

class PathCard extends StatelessWidget {
  final String label;
  final List<Color> gradientColors;
  final VoidCallback onTap;
  final Color? accentColor;

  const PathCard({
    super.key,
    required this.label,
    required this.gradientColors,
    required this.onTap,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: gradientColors,
            center: Alignment.center,
            radius: 0.9,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 6),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
