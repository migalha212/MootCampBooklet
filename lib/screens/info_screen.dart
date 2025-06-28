import 'package:campbooklet/widgets/contacts_list.dart';
import 'package:campbooklet/widgets/rule_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/camp_data_provider.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CampDataProvider>(context).data;

    final size = MediaQuery.of(context).size;
    final horizontalPadding = size.width * 0.06;
    final verticalSpacing = size.height * 0.02;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rules Section
                RulesList(rules: data?.rules, verticalSpacing: verticalSpacing),

                // Contacts Section
                ContactsList(
                  contacts: data?.contacts,
                  verticalSpacing: verticalSpacing,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
