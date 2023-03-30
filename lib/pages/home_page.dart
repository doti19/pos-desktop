import 'package:flutter/material.dart';

import '../config/my_colors.dart';
import '../widgets/home_page/item_order_widget.dart';
import '../widgets/home_page/item_tab_widget.dart';
import '../widgets/home_page/item_widget.dart';
import '../widgets/home_page/order_list_widget.dart';
import '../widgets/home_page/search_widget.dart';
import '../widgets/home_page/top_menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 14,
          child: Column(
            children: <Widget>[
              TopMenu(
                title: 'Yegna Electronics',
                subTitle: '16 March 2023',
                action: Search(),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text('Selected products',
                    style: Theme.of(context).textTheme.displayLarge),
              ),
              const Expanded(
                child: OrderWidget(),
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              TopMenu(
                title: 'Order',
                subTitle: 'Table 8',
                action: Container(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    ItemOrder(
                      image: 'assets/items/1.png',
                      title: 'White Airpod',
                      qty: '2',
                      price: '\$50.99',
                    ),
                    ItemOrder(
                      image: 'assets/items/2.png',
                      title: 'Photo Camera',
                      qty: '3',
                      price: '\$150.99',
                    ),
                    ItemOrder(
                      image: 'assets/items/3.png',
                      title: 'Laptop + Monitor',
                      qty: '2',
                      price: '\$1018.00',
                    ),
                    ItemOrder(
                      image: 'assets/items/4.png',
                      title: 'Headphone',
                      qty: '2',
                      price: '\$22.99',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: MyColors.background,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sub Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '\$2636.93',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Tax',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '\$395.53',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: 2,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '\$3032.46',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: MyColors.primaryVariant,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.print, size: 16),
                            SizedBox(width: 6),
                            Text('Print Bills')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
