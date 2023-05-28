import 'package:flutter/material.dart';

import '../../config/my_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.background,
          title: const Text("History", style: TextStyle(color: Colors.white)),
        ),
        body: Container(
            color: MyColors.mainContainer,
            child: const Center(child: Text("History"))));
  }
}
