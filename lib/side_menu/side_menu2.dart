import 'package:flutter/material.dart';

class SideMenu2 extends StatefulWidget {
  const SideMenu2({Key? key}) : super(key: key);

  @override
  _SideMenu2State createState() => _SideMenu2State();
}

class _SideMenu2State extends State<SideMenu2> {
  bool _isSubMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 200,
                color: Colors.blueGrey,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Menu Item 1'),
                      onTap: () {
                        setState(() {
                          _isSubMenuOpen = true;
                        });
                      },
                    ),
                    ListTile(
                      title: Text('Menu Item 2'),
                    ),
                    ListTile(
                      title: Text('Menu Item 3'),
                    ),
                    ListTile(
                      title: Text('Menu Item 4'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('Main Content'),
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            left: _isSubMenuOpen ? 200 : MediaQuery.of(context).size.width,
            right: _isSubMenuOpen ? 0 : MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.blueGrey,
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Sub-Menu Item 1'),
                  ),
                  ListTile(
                    title: Text('Sub-Menu Item 2'),
                  ),
                  ListTile(
                    title: Text('Sub-Menu Item 3'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
