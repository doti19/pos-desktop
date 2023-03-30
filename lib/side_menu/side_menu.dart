import 'package:animated_sidebar/animated_sidebar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_inner_drawer/inner_drawer.dart';

import '../widgets/side_menu/item_menu_widget.dart';
import '../widgets/side_menu/logo_widget.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key});
  static final List<SidebarItem> items = [
    SidebarItem(icon: Icons.rocket_sharp, text: 'Home'),
    SidebarItem(icon: Icons.history_toggle_off_rounded, text: 'History'),
    SidebarItem(icon: Icons.format_list_bulleted_rounded, text: 'Menu'),
    SidebarItem(icon: Icons.discount_outlined, text: 'Product')
  ];
  static const List<Widget> fixedMenuItems = <Widget>[
    ItemMenuWidget(menu: 'Home', icon: Icons.rocket_sharp, isActive: true),
    ItemMenuWidget(
        menu: 'History',
        icon: Icons.history_toggle_off_rounded,
        isActive: false),
    ItemMenuWidget(
        menu: 'Menu',
        icon: Icons.format_list_bulleted_rounded,
        isActive: false),
    ItemMenuWidget(
        menu: 'Product', icon: Icons.discount_outlined, isActive: false),
    // ItemMenuWidget(
    //   menu: 'Settings',
    //   icon: Icons.sports_soccer_outlined,
    //   isActive: false
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const LogoWidget(),
      const SizedBox(height: 20),
      Expanded(
        child: ListView(
          children: fixedMenuItems,
        ),
      ),
    ]);
  }
}

Widget innerDrawer() {
  return InnerDrawer(
      key: _innerDrawerKey,
      onTapClose: true, // default false
      swipe: false, // default true
      colorTransitionChild: Colors.red, // default Color.black54
      colorTransitionScaffold: Colors.black54, // default Color.black54

      //When setting the vertical offset, be sure to use only top or bottom
      offset: const IDOffset.only(bottom: 0.05, right: 0.0, left: 0.0),
      scale:
          const IDOffset.horizontal(0.8), // set the offset in both directions

      proportionalChildArea: true, // default true
      borderRadius: 50, // default 0
      leftAnimationType: InnerDrawerAnimation.static, // default static
      rightAnimationType: InnerDrawerAnimation.quadratic,
      backgroundDecoration: const BoxDecoration(
          color: Colors.red), // default  Theme.of(context).backgroundColor

      //when a pointer that is in contact with the screen and moves to the right or left
      // onDragUpdate: (double val, InnerDrawerDirection direction) {
      //     // return values between 1 and 0
      //     print(val);
      //     // check if the swipe is to the right or to the left
      //     print(direction==InnerDrawerDirection.start);
      // },

      innerDrawerCallback: (a) =>
          print(a), // return  true (open) or false (close)
      leftChild: Container(), // required if rightChild is not set
      rightChild: Container(), // required if leftChild is not set

      //  A Scaffold is generally used but you are free to use other widgets
      // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
      scaffold: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
      )
      /* OR
            CupertinoPageScaffold(                
                navigationBar: CupertinoNavigationBar(
                    automaticallyImplyLeading: false
                ),
            ), 
            */
      );
}

//  Current State of InnerDrawerState
final GlobalKey<InnerDrawerState> _innerDrawerKey =
    GlobalKey<InnerDrawerState>();

void _toggle() {
  _innerDrawerKey.currentState!.toggle(
      // direction is optional
      // if not set, the last direction will be used
      //InnerDrawerDirection.start OR InnerDrawerDirection.end
      // direction: InnerDrawerDirection.end);
      );
}
