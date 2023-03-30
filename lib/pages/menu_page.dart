import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../config/my_colors.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
// import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:animated_sidebar/animated_sidebar.dart';

import '../screens/menu_page/dashboard.dart';

class MenuPage extends StatefulWidget {
  MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // SideMenuController page = SideMenuController();
  final List<SidebarItem> items = [
    SidebarItem(icon: Icons.dashboard_customize, text: 'Dashboard'),
    SidebarItem(icon: Icons.notes, text: 'Documents'),
    SidebarItem(icon: Icons.shopping_cart, text: 'Products'),
    SidebarItem(icon: Icons.inventory_2, text: 'Stock'),
    SidebarItem(icon: Icons.bar_chart, text: 'Report'),
    SidebarItem(icon: Icons.security, text: 'Users & Security'),
    SidebarItem(icon: Icons.payment, text: 'Payment types'),
    SidebarItem(icon: Icons.percent, text: 'Tax rates'),
    SidebarItem(icon: Icons.other_houses, text: 'My Company'),
  ];

  final List<Widget> contents = [
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
  ];

  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    // final _controller = SidebarXController(selectedIndex: 0, extended: true);
    // final _key = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: MyColors.mainContainer,
      appBar: AppBar(
        backgroundColor: MyColors.background,
        title: const Text("hello", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          children: [
            AnimatedSidebar(
              frameDecoration: BoxDecoration(
                color: MyColors.background,
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
              itemHoverColor: MyColors.primaryVariant,
              itemSelectedColor: MyColors.primary,
              expanded: MediaQuery.of(context).size.width > 600,
              items: items,
              selectedIndex: activeTab,
              autoSelectedIndex: false,
              onItemSelected: (index) => setState(() {
                activeTab = index;
              }),
              itemTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
              headerIcon: Icons.display_settings_outlined,
              headerIconColor: Colors.amberAccent,
              headerText: 'Management',
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.background,
                  // border: Border.all(
                  //     color: Colors.black87,
                  //     width: 1.0,
                  //     strokeAlign: BorderSide.strokeAlignOutside),
                ),
                child: contents[activeTab],
              ),
            ),
          ],
        ),
      ),

      // body: Row(
      //   children: [
      //     SideMenu(
      //       backgroundColor: MyColors.background,
      //       builder: (data) => SideMenuData(
      //         header:
      //             const Text('Header', style: TextStyle(color: Colors.black)),
      //         items: [
      //           SideMenuItemDataTile(
      //             isSelected: true,
      //             onTap: () {},
      //             title: 'Item 1',
      //             icon: const Icon(Icons.home),
      //           ),
      //           SideMenuItemDataTile(
      //             isSelected: false,
      //             onTap: () {},
      //             title: 'Item 2',
      //             icon: const Icon(Icons.home),
      //           ),
      //         ],
      //         footer: const Text(
      //           'Footer',
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         color: Colors.black,
      //         child: const Center(
      //           child: Text(
      //             'body',
      //           ),
      //         ),
      //       ),
      //     ),
      //     // SideMenu(
      //     //   position: SideMenuPosition.right,
      //     //   builder: (data) => const SideMenuData(
      //     //     customChild: Text('Custom view'),
      //     //   ),
      //     // ),
      //   ],
      // ),

      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     SideMenu(
      //       // Page controller to manage a PageView
      //       controller: page,
      //       // Will shows on top of all items, it can be a logo or a Title text
      //       title: Image.asset('assets/items/1.png'),
      //       // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
      //       footer: Text('demo'),
      //       // Notify when display mode changed
      //       onDisplayModeChanged: (mode) {
      //         print(mode);
      //       },
      //       // List of SideMenuItem to show them on SideMenu
      //       items: items,
      //     ),
      //     Expanded(
      //       child: PageView(
      //         controller: page.,
      //         children: [
      //           Container(
      //             child: Center(
      //               child: Text('Dashboard'),
      //             ),
      //           ),
      //           Container(
      //             child: Center(
      //               child: Text('Settings'),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

// class SideBarWidget extends StatelessWidget {
//   const SideBarWidget({Key? key, required SidebarXController controller})
//       : _controller = controller,
//         super(key: key);
//   final SidebarXController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return SidebarX(
//       controller: _controller,
//       theme: SidebarXTheme(
//           decoration: BoxDecoration(
//             color: MyColors.primary,
//             borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(20),
//                 bottomRight: Radius.circular(20)),
//           ),
//           iconTheme: IconThemeData(color: Colors.white)),
//     );
//   }
// }
// 