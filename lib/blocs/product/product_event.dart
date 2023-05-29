part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class FetchAllProductEvent extends ProductEvent {
  const FetchAllProductEvent();

  @override
  List<Object> get props => [];
}

class FetchSpecificProductEvent extends ProductEvent {
  const FetchSpecificProductEvent();

  @override
  List<Object> get props => [];
}

class AddDataEvent extends ProductEvent {
  final Product product;
  const AddDataEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class DeleteSpecificProductEvent extends ProductEvent {
  final Product product;

  const DeleteSpecificProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class DeleteAllProductsEvent extends ProductEvent {
  const DeleteAllProductsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateSpecificProductEvent extends ProductEvent {
  final Product product;
  final String name;
  final String code;
  final List<String> barcode;
  final String unitOfMeasurement;
  final String group;
  final bool isActive;
  final bool isDefaultQuantity;
  final bool isService;
  final String age;
  final String description;
  final double cost;
  final double markup;
  final double salePrice;
  final bool doesPriceIncludeTax;
  final bool isPriceChangeAllowed;
  final String supplier;
  final int reorderPoint;
  final int preferredQuantity;
  final bool lowStockWarning;
  final int lowStockWarningQuantity;
  final String color;
  final Uint8List image;
  final List<String> comments;

  const UpdateSpecificProductEvent(
      {required this.product,
      required this.name,
      required this.code,
      required this.barcode,
      required this.unitOfMeasurement,
      required this.group,
      required this.isActive,
      required this.isDefaultQuantity,
      required this.isService,
      required this.age,
      required this.description,
      required this.cost,
      required this.markup,
      required this.salePrice,
      required this.doesPriceIncludeTax,
      required this.isPriceChangeAllowed,
      required this.supplier,
      required this.reorderPoint,
      required this.preferredQuantity,
      required this.lowStockWarning,
      required this.lowStockWarningQuantity,
      required this.color,
      required this.image,
      required this.comments});

  @override
  List<Object> get props => [name, code];
  // List<Object> get props => [product, name, code, barcode, unitOfMeasurement, group, isActive, isDefaultQuantity, isService, age, description, cost, markup, salePrice, doesPriceIncludeTax, isPriceChangeAllowed, supplier, reorderPoint, preferredQuantity, lowStockWarningQuantity, color, image, comments];
}
