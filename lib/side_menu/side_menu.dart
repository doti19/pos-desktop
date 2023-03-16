
import 'package:flutter/material.dart';

import '../widgets/side_menu/item_menu_widget.dart';
import '../widgets/side_menu/logo_widget.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const LogoWidget(),
      const SizedBox(height: 20),
      Expanded(
        child: ListView(
          children: const <Widget> [
            ItemMenuWidget(
              menu: 'Home',
              icon: Icons.rocket_sharp,
              isActive: true
            ),
            ItemMenuWidget(
              menu: 'Menu',
              icon: Icons.format_list_bulleted_rounded,
              isActive: false
            ),
            ItemMenuWidget(
              menu: 'History',
              icon: Icons.history_toggle_off_rounded,
              isActive: false
            ),
            ItemMenuWidget(
              menu: 'Promos',
              icon: Icons.discount_outlined,
              isActive: false
            ),
            ItemMenuWidget(
              menu: 'Settings',
              icon: Icons.sports_soccer_outlined,
              isActive: false
            ),
          ],
        ),
      ),
    ]);
  }
}