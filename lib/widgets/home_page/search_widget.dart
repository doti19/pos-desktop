import 'package:flutter/material.dart';

import '../../config/my_colors.dart';

class Search extends StatelessWidget {
  Search({super.key});
  final List<String> _chooseMethod = [
    "Name",
    "Barcode",
    "Product Code",
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(flex: 1, child: buttons()),
        Expanded(
          flex: 3,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: MyColors.background,
              ),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.search,
                    color: Colors.white54,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Search menu here...',
                    style: TextStyle(color: Colors.white54, fontSize: 11),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

Widget buttons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      IconButton(
        onPressed: () => {print('Name')},
        icon: const Icon(Icons.notes),
      ),
      IconButton(
        onPressed: () => {print('Barcode')},
        icon: const Icon(Icons.qr_code),
      ),
      IconButton(
        onPressed: () => {print('Product code')},
        icon: const Icon(Icons.pin),
      ),
    ],
  );
}
