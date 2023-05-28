import 'package:flutter/material.dart';

import '../../../config/my_colors.dart';
import '../dashboard/dashboard_screen.dart';
import '../document/documents_screen.dart';
import '../products/products_screen.dart';
import '../report/report_screen.dart';
import '../stock/stock_screen.dart';


import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      appBar: AppBar(
        backgroundColor: MyColors.background,
        title: const Text("Management", style: TextStyle(color: Colors.white)),
      ),

      body: const SidebarPage(),
    );
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  late Widget _mainBody;
  final AssetImage _avatarImg = const AssetImage('assets/logo/logo_icon.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
    _mainBody = const DashboardScreen();
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.dashboard,
        onPressed: () => setState(() {
          _headline = 'DashBoard';
          _mainBody = const DashboardScreen();
        }),
        // onHold: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: const Text("Dashboard"))),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Documents',
        icon: Icons.summarize,
        onPressed: () => setState(() {
          _headline = 'Documents';
          _mainBody = DocumentsScreen();
        }),
        // onHold: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: const Text("Documents"))),
      ),
      CollapsibleItem(
        text: 'Products',
        icon: Icons.category,
        onPressed: () => setState(() {
          _headline = 'DashBoard';
          _mainBody = const ProductsScreen();
        }),
        // onHold: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: const Text("Products"))),
      ),
      CollapsibleItem(
        text: 'Stock',
        icon: Icons.inventory,
        onPressed: () => setState(() {
          _headline = 'DashBoard';
          _mainBody = const StockScreen();
        }),
        // onHold: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: const Text("Stock"))),
      ),
      CollapsibleItem(
        text: 'Report',
        icon: Icons.assessment,
        onPressed: () => setState(() {
          _headline = 'Report';
          _mainBody = ReportScreen();
        }),
        // onHold: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: const Text("Report"))),
      ),
      CollapsibleItem(
        text: 'User Security',
        icon: Icons.admin_panel_settings,
        onPressed: () => setState(() => _headline = 'User Security'),
        // onHold: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: const Text("User Security"))),
      ),
      CollapsibleItem(
        text: 'Payment Type',
        icon: Icons.paid,
        onPressed: () => setState(() => _headline = 'Payment Type'),
        // onHold: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: const Text("Payment Type"))),
      ),
      CollapsibleItem(
        text: 'Tax Rate',
        icon: Icons.percent,
        onPressed: () => setState(() => _headline = 'Tax Rate'),
        // onHold: () => ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: const Text("Tax Rate"))),
      ),
      CollapsibleItem(
        text: 'My Company',
        icon: Icons.local_convenience_store,
        onPressed: () => setState(() => _headline = 'My Company'),
        //   onHold: () => ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: const Text("My Company"))),
        // ),
      ),
      //
    ];
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        // collapseOnBodyTap: true,
        avatarImg: _avatarImg,
        title: _headline,

        // onTitleTap: () {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        // },
        body: _mainBody,
        // body: Center(child: Text("hello")),
        backgroundColor: MyColors.background,
        selectedTextColor: Colors.limeAccent,
        textStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: const TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: [
          const BoxShadow(
            color: Colors.indigo,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: MyColors.primaryVariant,
            blurRadius: 10,
            spreadRadius: 0.01,
            offset: const Offset(3, 3),
          ),
        ],
        selectedIconColor: MyColors.primary,
        // selectedIconBox: MyColors.mainContainer,
        unselectedIconColor: Colors.white,
        unselectedTextColor: Colors.white,
      ),
    );
  }

  Widget _body(Size size, BuildContext context, Widget body) {
    return body;
  }
}
