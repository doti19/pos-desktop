import 'package:flutter/material.dart';

import '../../../../config/my_colors.dart';

class ReportItems extends StatelessWidget {
  final String title;
  final int data;
  const ReportItems({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.mainContainer),
        // color: Colors.amberAccent,
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ),
          Container(
            alignment: Alignment.center,
            // width: 300,
            height: 200,
            child: data < 0
                ? Text("No data to display",
                    style: TextStyle(fontSize: 15, color: Colors.white54))
                : Text(
                    "$data",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
          ),
        ],
      ),
    );
  }
}
