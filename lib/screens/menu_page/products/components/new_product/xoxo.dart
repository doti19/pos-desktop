import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_desktop2/screens/menu_page/products/components/new_product/tabs/yoho.dart';

// import '../../../../../blocs/product/product_bloc.dart';
// import '../../../../../models/product/product.dart';

class XoXo extends StatelessWidget {
  const XoXo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("XoXo")),
      body: const Yoho(),
      floatingActionButton: FloatingActionButton(
        child: const Text('add'),
        onPressed: () {
          // context
          //     .read<ProductBloc>()
          //     .add(AddDataEvent(product: Product()..name = 'yoniXoXo'));
        },
      ),
    );
  }
}
