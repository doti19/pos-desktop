import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pos_desktop2/config/my_colors.dart';

import '../../../../core/constants/color_constants.dart';
import 'monthly_Bar.dart';
import 'totalSales.dart';

class MonthlySales extends StatelessWidget {
  const MonthlySales({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 4,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.mainContainer),
                    // color: Colors.amberAccent,
                  ),
                  child: const MonthlyBar())),
          const SizedBox(width: 10.0),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.mainContainer),
                  // color: Colors.amberAccent,
                ),
                child: const TotalSales(),
              )),
        ],
      ),
    );
  }
}
