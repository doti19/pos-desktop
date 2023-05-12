import 'package:flutter/material.dart';

class PrintStations extends StatelessWidget {
  const PrintStations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            disabledForegroundColor: Colors.grey,
            foregroundColor: Colors.white,
          ),
          onPressed: null,
          child: Text('Assign print station'),
        ));
  }
}
