import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String code;

  @HiveField(2)
  late List<String> barcode;

  @HiveField(3)
  late String unitOfMeasurement;

  @HiveField(4)
  late String group;

  @HiveField(5)
  late bool isActive;

  @HiveField(6)
  late bool isDefaultQuantity;

  @HiveField(7)
  late bool isService;

  @HiveField(8)
  late String age;

  @HiveField(9)
  late String description;

  @HiveField(10)
  late double cost;

  @HiveField(11)
  late double markup;

  @HiveField(12)
  late double salePrice;

  @HiveField(13)
  late bool doesPriceIncludeTax;

  @HiveField(14)
  late bool isPriceChangeAllowed;

  @HiveField(15)
  late String supplier;

  @HiveField(16)
  late int reorderPoint;

  @HiveField(17)
  late int preferredQuantity;

  @HiveField(18)
  late bool lowStockWarning;

  @HiveField(19)
  late int lowStockWarningQuantity;

  @HiveField(20)
  late String color;

  @HiveField(21)
  late Uint8List? image;

  @HiveField(22)
  late List<String> comments;
}
