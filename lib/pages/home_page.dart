import 'package:flutter/material.dart';

import '../config/myColors.dart';
import '../widgets/home_page/item_order_widget.dart';
import '../widgets/home_page/item_tab_widget.dart';
import '../widgets/home_page/item_widget.dart';
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
            children:<Widget> [
              const TopMenu(
                title: 'Lorem Restourant',
                subTitle: '20 October 2022',
                action: Search(),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    ItemTab(
                      icon: 'assets/icons/icon-burger.png',
                      title: 'Burger',
                      isActive: true,
                    ),
                    ItemTab(
                      icon: 'assets/icons/icon-noodles.png',
                      title: 'Noodles',
                      isActive: false,
                    ),
                    ItemTab(
                      icon: 'assets/icons/icon-drinks.png',
                      title: 'Drinks',
                      isActive: false,
                    ),
                    ItemTab(
                      icon: 'assets/icons/icon-desserts.png',
                      title: 'Desserts',
                      isActive: false,
                    )
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: (1 / 1.2),
                  children: const <Widget>[
                    Item(
                      image: 'assets/items/1.png',
                      title: 'Original Burger',
                      price: '\$5.99',
                      item: '11 item',
                    ),
                    Item(
                      image: 'assets/items/2.png',
                      title: 'Double Burger',
                      price: '\$10.99',
                      item: '10 item',
                    ),
                    Item(
                      image: 'assets/items/3.png',
                      title: 'Cheese Burger',
                      price: '\$6.99',
                      item: '7 item',
                    ),
                    Item(
                      image: 'assets/items/4.png',
                      title: 'Double Cheese Burger',
                      price: '\$12.99',
                      item: '20 item',
                    ),
                    Item(
                      image: 'assets/items/5.png',
                      title: 'Spicy Burger',
                      price: '\$7.39',
                      item: '12 item',
                    ),
                    Item(
                      image: 'assets/items/6.png',
                      title: 'Special Black Burger',
                      price: '\$7.39',
                      item: '39 item',
                    ),
                    Item(
                      image: 'assets/items/7.png',
                      title: 'Special Cheese Burger',
                      price: '\$8.00',
                      item: '2 item',
                    ),
                    Item(
                      image: 'assets/items/8.png',
                      title: 'Jumbo Cheese Burger',
                      price: '\$15.99',
                      item: '2 item',
                    ),
                    Item(
                      image: 'assets/items/9.png',
                      title: 'Spicy Burger',
                      price: '\$7.39',
                      item: '12 item',
                    ),
                    Item(
                      image: 'assets/items/10.png',
                      title: 'Special Black Burger',
                      price: '\$7.39',
                      item: '39 item',
                    ),
                    Item(
                      image: 'assets/items/11.png',
                      title: 'Special Cheese Burger',
                      price: '\$8.00',
                      item: '2 item',
                    ),
                    Item(
                      image: 'assets/items/12.png',
                      title: 'Jumbo Cheese Burger',
                      price: '\$15.99',
                      item: '2 item',
                    ),
                  ],
                ),
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
                      title: 'Orginal Burger',
                      qty: '2',
                      price: '\$5.99',
                    ),
                    ItemOrder(
                      image: 'assets/items/2.png',
                      title: 'Double Burger',
                      qty: '3',
                      price: '\$10.99',
                    ),
                    ItemOrder(
                      image: 'assets/items/6.png',
                      title: 'Special Black Burger',
                      qty: '2',
                      price: '\$8.00',
                    ),
                    ItemOrder(
                      image: 'assets/items/4.png',
                      title: 'Special Cheese Burger',
                      qty: '2',
                      price: '\$12.99',
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
                            '\$40.32',
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
                            '\$4.32',
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
                            '\$44.64',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.deepOrange,
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