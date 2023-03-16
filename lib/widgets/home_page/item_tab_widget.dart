import 'package:flutter/material.dart';

import '../../config/myColors.dart';

class ItemTab extends StatelessWidget {
  final String icon;
  final String title;
  final bool isActive;
  const ItemTab({required this.icon, required this.title, required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 26),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.background,
        border: isActive
            ? Border.all(color: MyColors.primary, width: 3)
            : Border.all(color: MyColors.background, width: 3),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 38,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}