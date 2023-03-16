import 'package:flutter/material.dart';

import '../../config/myColors.dart';

class ItemMenuWidget extends StatelessWidget {
  final String menu;
  final IconData icon;
  final bool isActive;
  const ItemMenuWidget({required this.menu, required this.icon, required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: GestureDetector(
        onTap: /*() => _setPage(menu)*/ null,
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // color: Colors.transparent,
                color: isActive
                    ? MyColors.primary
                    : Colors.transparent,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.slowMiddle,
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}