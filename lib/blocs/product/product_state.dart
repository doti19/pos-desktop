part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  // @override
  // List<Object> get props => [];
}

class ProductInitial extends ProductState {
  final bool? success;
  ProductInitial({this.success});

  @override
  List<Object?> get props => [success];
}
