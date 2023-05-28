import 'package:flutter/material.dart';

import 'top_products.dart';

class PeriodicReports extends StatelessWidget {
  const PeriodicReports({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return const Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Text(
                "Periodic Reports (4/3/2023- 5/3/2023)",
                style: TextStyle(fontSize: 25),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                  onPressed: null, icon: Icon(Icons.calendar_today_rounded)),
            )
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(child: ReportItems(title: "Top Products", data: -1)),
            Flexible(child: ReportItems(title: "Hourly Sales", data: -1)),
            Flexible(
                child: ReportItems(title: "Total Sales (Amount)", data: 0)),
            // HourlySales(),
            // TotalSalesAmount(),
          ],
        ),
      ],
    );
  }
}
