import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../../blocs/product/product_bloc.dart';
import '../../../../../../db/boxes.dart';
import '../../../../../../models/product/product.dart';

class Yoho extends StatelessWidget {
  const Yoho({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),

      child: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductInitial) {
          context.read<ProductBloc>().add(const FetchAllProductEvent());
        }
        if (state is DisplayAllProductsState) {
          if (state.products.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.products.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                            onTap: () {
                              context.read<ProductBloc>().add(
                                  DeleteSpecificProductEvent(
                                      product: state.products[i]));
                            },
                            child: Container(
                                height: 20,
                                margin: const EdgeInsets.only(bottom: 14),
                                child: Card(
                                    elevation: 10,
                                    color: i % 2 == 0
                                        ? Colors.blueAccent
                                        : Colors.brown,
                                    child: Text(state.products[i].name))));
                      }),
                ),
              ],
            );
          }
        }
        return Center(
            child: Text('empty'.toUpperCase(), style: TextStyle(fontSize: 21)));
      }),

      // child: ValueListenableBuilder<Box<Product>>(
      //   valueListenable: Boxes.getProducts().listenable(),
      //   builder: (context, box, _) {
      //     final products = box.values.toList().cast<Product>();
      //     return buildContent(products);
      //   },
      // ),
    );
  }

  Widget buildContent(List<Product> products) {
    if (products.isEmpty) {
      return Center(
        child: Text(
          'No products yet!',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = products[index];

                return buildProduct(context, transaction);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildProduct(
    BuildContext context,
    Product product,
  ) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          product.name,
          maxLines: 2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        children: [
          buildButtons(context, product),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context, Product product) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: Text('Edit'),
              icon: Icon(Icons.edit),
              onPressed: null,
            ),
          ),
          Expanded(
            child: TextButton.icon(
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: null,
            ),
          )
        ],
      );
}
