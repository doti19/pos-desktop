import 'package:flutter/material.dart';

import '../../../config/my_colors.dart';
import '../../../responsive.dart';
import '../dashboard/dashboard_screen.dart';
import 'components/side_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      appBar: AppBar(
        backgroundColor: MyColors.background,
        title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
      ),
      drawer: Responsive.isMobile(context) ? const SideMenu() : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (!Responsive.isMobile(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
