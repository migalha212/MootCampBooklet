import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/camp_data_provider.dart';

class PageHeader extends StatelessWidget implements PreferredSizeWidget {
  // REMOVE 'const' from the constructor here
  PageHeader({super.key}); // No 'const'

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<CampDataProvider>(context).theme!;
    final primary = theme.colorScheme.primary;
    final size = MediaQuery.of(context).size;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primary,
      toolbarHeight: size.height * 0.10,
      title: Text(
              'Apple Land',
              style: TextStyle(
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20.0);
}
