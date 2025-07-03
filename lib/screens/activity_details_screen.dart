import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/activity.dart';
import '../services/camp_data_provider.dart';

class ActivityDetailScreen extends StatelessWidget {
  final String activityId;

  const ActivityDetailScreen({super.key, required this.activityId});

  @override
  Widget build(BuildContext context) {
    final campProvider = Provider.of<CampDataProvider>(context);
    final Activity? activity = campProvider.activitiesMap?[activityId];
    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.06;

    return Scaffold(
      appBar: AppBar(
        title: Text(activity?.name ?? 'Activity'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: activity == null
          ? Center(
              child: Text(
                'No activity available.',
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: Colors.black54,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner image
                  if (activity.banner.isNotEmpty)
                    Image.asset(
                      'assets/images/${activity.banner}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: size.height * 0.3,
                    ),

                  Padding(
                    padding: EdgeInsets.all(horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          activity.name,
                          style: TextStyle(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          activity.description,
                          style: TextStyle(
                            fontSize: size.width * 0.04,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
