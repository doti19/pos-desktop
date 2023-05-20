import 'package:hive/hive.dart';

import '../models/product/product.dart';

class Boxes {
  static Box<Product> getProducts() => Hive.box<Product>('products');
}
