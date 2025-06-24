import 'dart:convert';

import 'package:campbooklet/models/path_info.dart';
import 'package:campbooklet/services/camp_data_provider.dart';
import 'package:campbooklet/widgets/path_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChoosePathScreen extends StatefulWidget {
  const ChoosePathScreen({super.key});
  static const Color accentRed = Color(0xFFE50000);

  @override
  State<ChoosePathScreen> createState() => _ChoosePathScreenState();
}

class _ChoosePathScreenState extends State<ChoosePathScreen> {
  late Future<List<PathInfo>> _pathsFuture;

  @override
  void initState() {
    super.initState();
    _pathsFuture = _loadPaths();
  }

  Future<List<PathInfo>> _loadPaths() async {
    final jsonStr = await rootBundle.loadString('assets/data/paths.json');
    final List<dynamic> jsonData = jsonDecode(jsonStr);
    return jsonData.map((e) => PathInfo.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final double logoHeight = screenHeight * 0.17;
    final double verticalSpacingLarge = screenHeight * 0.05;
    final double verticalSpacingMedium = screenHeight * 0.03;
    final double horizontalPadding = screenWidth * 0.06;

    final campProvider = Provider.of<CampDataProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF0F5F9), Color(0xFFE0E5EA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<List<PathInfo>>(
            future: _pathsFuture,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final paths = snapshot.data!;

              return Column(
                children: [
                  SizedBox(height: verticalSpacingLarge),
                  Center(
                    child: SizedBox(
                      height: logoHeight,
                      child: Image.asset(
                        'assets/images/moot_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalSpacingLarge),
                  Padding(
                    padding: EdgeInsets.only(left: horizontalPadding + 4),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select your path:",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: verticalSpacingMedium),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: screenHeight * 0.025,
                        crossAxisSpacing: screenWidth * 0.05,
                        childAspectRatio: 1,
                        children: paths.map((path) {
                          return PathCard(
                            label: path.label,
                            gradientColors: [path.primary, path.secondary],
                            onTap: () => campProvider.loadPath(path.id),
                            accentColor: ChoosePathScreen.accentRed,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding + 4,
                              vertical: screenHeight * 0.03,
                            ),
                            child: const Text(
                              'Once a path is chosen, you will be directed to its page upon opening. This can be changed in Settings.',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          SizedBox(height: verticalSpacingMedium),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
