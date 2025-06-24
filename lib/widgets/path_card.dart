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
        child: Stack(
          // Use Stack to layer the band and the text
          children: [
            // This is the red band positioned in the vertical center
            if (accentColor != null)
              Center(
                // Center the band horizontally and vertically in its parent (the card)
                child: Container(
                  height:
                      50, // Fixed height for the red band. Adjust as needed.
                  width: double
                      .infinity, // Makes the band span the full width of the card
                  color: accentColor,
                ),
              ),
            // The text label remains centered on top of everything
            Center(
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
          ],
        ),
      ),
    );
  }
}

// Remove the _TrianglePainter class as it's no longer used.
