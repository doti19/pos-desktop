import 'package:flutter/material.dart';

class TotalSales extends StatelessWidget {
  const TotalSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Total Sales",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "120",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              "Top performing month:",
              style: TextStyle(fontSize: 20, color: Colors.white54),
            ),
            Text(
              "MARCH",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54),
            ),
            Text(
              "120.00",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54),
            )
          ],
        )
      ],
    );
  }
}
