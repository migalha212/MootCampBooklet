import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ExpandableImage extends StatelessWidget {
  final String assetPath;
  final double height;
  final double borderRadius;

  const ExpandableImage({
    super.key,
    required this.assetPath,
    required this.height,
    required this.borderRadius,
  });

  void _openFullScreen(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black87,
      barrierLabel: 'Dismiss',
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (ctx, _, __) {
        return GestureDetector(
          onTap: () => Navigator.of(ctx).pop(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                // Image viewer
                Center(
                  child: GestureDetector(
                    onTap: () {}, // Prevent closing when tapping the image
                    child: PhotoView(
                      imageProvider: AssetImage(assetPath),
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 3,
                    ),
                  ),
                ),

                // Close button
                Positioned(
                  top: MediaQuery.of(ctx).padding.top + 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFullScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          height: height,
          width: double.infinity,
        ),
      ),
    );
  }
}
