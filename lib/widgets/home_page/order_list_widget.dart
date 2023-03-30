import 'package:flutter/material.dart';

import '../../config/my_colors.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        int item = 1;
        return ListTile(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (item > 0) {
                      item = item - 1;
                    }
                  });
                },
              ),
              Text(
                item.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    item = item + 1;
                  });
                },
              ),
            ],
          ),
          subtitle: Text(item.toString()),
          trailing: const Text('\$10.00'),
        );
      },
    );
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        int item = 1;
        return Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: MyColors.background),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24),
                  ),
                ),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage("assets/items/4.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              title: Text(
                "Burger",
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              // subtitle: Text("\$4.50",
              //     style: Theme.of(context).textTheme.bodyMedium),
              subtitle: Row(
                children: <Widget>[
                  const Icon(Icons.linear_scale, color: Colors.yellowAccent),
                  Text("\$4.50", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  addRemove(),
                  Container(
                    padding: const EdgeInsets.only(left: 12.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            left:
                                BorderSide(width: 1.0, color: Colors.white54))),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget addRemove() {
  return Row(
    children: [
      IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () {
          print('reduced');
        },
      ),
      const Text(
        "2",
        style: TextStyle(fontSize: 10),
      ),
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          print('added');
        },
      )
    ],
  );
}
