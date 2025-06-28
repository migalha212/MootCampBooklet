import 'package:campbooklet/widgets/expandable_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/camp_data_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CampDataProvider>(context).data;

    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.06;
    final verticalSpacingSmall = size.height * 0.015;
    final verticalSpacingMedium = size.height * 0.03;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: verticalSpacingSmall),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              'Welcome to your adventure!',
              style: TextStyle(
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          SizedBox(height: verticalSpacingSmall),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              'This app is your digital guide throughout the camp. Use it to check your schedule, story, rules, and more!',
              style: TextStyle(
                fontSize: size.width * 0.035,
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          SizedBox(height: verticalSpacingSmall),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Divider(thickness: 2),
          ),

          SizedBox(height: verticalSpacingSmall),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              'Path Story',
              style: TextStyle(
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),

          SizedBox(height: verticalSpacingSmall),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Container(
              height: size.height * 0.22,
              padding: const EdgeInsets.only(right: 4),
              child: Scrollbar(
                thumbVisibility: true,
                radius: const Radius.circular(8),
                child: SingleChildScrollView(
                  child: Text(
                    data?.story ?? 'No story available.',
                    style: TextStyle(
                      fontSize: size.width * 0.038,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: verticalSpacingSmall),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const Divider(thickness: 2),
          ),

          SizedBox(height: verticalSpacingSmall),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: ExpandableImage(
              assetPath: 'assets/images/apple_land_map.png',
              height: size.height * 0.35,
              borderRadius: size.width * 0.03,
            ),
          ),

          SizedBox(height: verticalSpacingMedium),
        ],
      ),
    );
  }
}
