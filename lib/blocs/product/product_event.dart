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

class UpdateSpecificProductEvent extends ProductEvent {
  final Product product;
  final String name;
  const UpdateSpecificProductEvent({required this.product, required this.name});

  @override
  List<Object> get props => [name, product];
}
