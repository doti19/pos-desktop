part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  // @override
  // List<Object> get props => [];
}

class ProductInitial extends ProductState {
  ProductInitial();

  @override
  List<Object?> get props => [];
}

class DisplayAllProductsState extends ProductState {
  final List<Product> products;
  const DisplayAllProductsState({required this.products});

  @override
  List<Object> get props => [products];
}

class DisplaySpecificProdcutState extends ProductState {
  final Product product;
  const DisplaySpecificProdcutState({required this.product});
  @override
  List<Object> get props => [product];
}
