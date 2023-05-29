import 'package:animated_sidebar/animated_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:pos_desktop2/pages/home_page.dart';
import 'package:pos_desktop2/side_menu/side_menu.dart';
// import 'package:desktop/desktop.dart' as desktop;
import 'package:responsive_navigation/responsive_navigation.dart' as resp;
import 'package:easy_sidemenu/easy_sidemenu.dart';

import '../config/my_colors.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);
  static final List<SidebarItem> items = [
    SidebarItem(icon: Icons.rocket_sharp, text: 'Home'),
    SidebarItem(icon: Icons.history_toggle_off_rounded, text: 'History'),
    SidebarItem(icon: Icons.format_list_bulleted_rounded, text: 'Menu'),
    SidebarItem(icon: Icons.discount_outlined, text: 'Product')
  ];

  static final List<resp.NavItem> items2 = [
    resp.NavItem(
        // builder: (context, index) => Center(child: Text("Home")),
        label: "Home",
        icon: const Icon(Icons.add_reaction_rounded)),
    resp.NavItem(
        // builder: (context, index) => Center(child: Text("Home")),
        label: "Home",
        icon: const Icon(Icons.add_reaction_rounded)),
  ];
  static final List<SideMenuItem> items3 = [
    const SideMenuItem(
      // Priority of item to show on SideMenu, lower value is displayed at the top
      priority: 0,
      title: 'Dashboard',
      onTap: null,
      icon: Icon(Icons.home),
      badgeContent: Text(
        '3',
        style: TextStyle(color: Colors.white),
      ),
    ),
    SideMenuItem(
      priority: 1,
      title: 'Settings',
      onTap: (index, controller) => print('hey'),
      icon: const Icon(Icons.settings),
    ),
    SideMenuItem(
      priority: 2,
      title: 'Exit',
      onTap: (index, controller) => print("hello"),
      icon: const Icon(Icons.exit_to_app),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // SideMenuController page = SideMenuController();
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Row(
        children: [
          //
          Container(
              width: 70,
              padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
              height: MediaQuery.of(context).size.height,
              child: const SideMenuWidget()),

          // Expanded(child: desktop.Nav(items: items2)),
          // AnimatedSidebar(
          //   expanded: false,
          //   items: items,
          //   itemSelectedColor: MyColors.primary,
          //   itemHoverColor: MyColors.primaryVariant,
          //   selectedIndex: 0,
          //   onItemSelected: (index) => print(index),
          //   frameDecoration: BoxDecoration(color: MyColors.background),
          //   header: const LogoWidget(),
          //   // headerIcon: Icons.ac_unit_sharp,
          //   // headerIconColor: Colors.amberAccent,
          //   // headerText: 'Example',
          // ),
          // TuanisSidebar(
          //   sectionsAligment: MainAxisAlignment.start,
          //   selectedColor: Colors.white,
          //   selectedTileColor: Colors.blue,
          //   selectedItemId: 'settings',
          //   sections: const [
          //     TuanisSidebarSection(
          //       title: Text(
          //         'MAIN',
          //         style: TextStyle(letterSpacing: 1.2),
          //       ),
          //       items: [
          //         TuanisSidebarItem(
          //           id: 'dashboard',
          //           tile: ListTile(
          //             leading: Icon(Icons.dashboard),
          //             title: Text('Dashboard'),
          //           ),
          //           items: [
          //             TuanisSidebarItem(
          //               id: 'dashboard_1',
          //               tile: ListTile(
          //                 leading: Icon(Icons.abc),
          //                 title: Text('Child of Dashboard'),
          //               ),
          //             )
          //           ],
          //         ),
          //         TuanisSidebarItem(
          //           id: 'settings',
          //           tile: ListTile(
          //             title: Text('Settings'),
          //             leading: Icon(Icons.settings),
          //           ),
          //         )
          //       ],
          //     ),
          //     TuanisSidebarSection(
          //       borderColor: Color(0xffcbd5e1),
          //       items: [
          //         TuanisSidebarItem(
          //           id: 'logout',
          //           tile: ListTile(
          //             leading: Icon(Icons.logout),
          //             title: Text('Logout'),
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          // SideMenu(
          //   // Page controller to manage a PageView
          //   controller: page,
          //   // Will shows on top of all items, it can be a logo or a Title text
          //   title: Text("hellow"),
          //   // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
          //   footer: Text('demo'),
          //   // Notify when display mode changed
          //   onDisplayModeChanged: (mode) {
          //     print(mode);
          //   },
          //   // List of SideMenuItem to show them on SideMenu
          //   items: items3,
          // ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24, right: 12),
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: MyColors.mainContainer,
              ),
              child: const HomePage(),
            ),
          ),
        ],
      ),
    );
  }
}
