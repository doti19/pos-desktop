import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../db/boxes.dart';
import '../../models/product/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductInitial()) {
    Box<Product> boxProduct;
    List<Product> products = [];
    Product? product;
    on<FetchAllProductEvent>((event, emit) {
      try {
        boxProduct = Boxes.getProducts();
        products = boxProduct.values.toList();
        emit(DisplayAllProductsState(products: products));
      } catch (e) {
        print('failed FetchAllProductEvent: $e');
      }
    });

    on<AddDataEvent>((event, emit) {
      try {
        final box = Boxes.getProducts();
        box.add(event.product);
        add(const FetchAllProductEvent());
      } catch (e) {
        print('failed AddDataEvent: $e');
      }
    });
    on<UpdateSpecificProductEvent>((event, emit) {
      try {
        product = event.product;
        product!.name = event.name;
        product!.image = event.image;

        product!.save();
        add(const FetchAllProductEvent());
      } catch (e) {
        print('failed UpdateSpecificProductEvent: $e');
      }
    });

    on<DeleteAllProductsEvent>((event, Emit) {
      try {
        final box = Boxes.getProducts();
        box.clear();
      } catch (e) {
        print('failed deleteAllProducts');
      }
    });

    on<DeleteSpecificProductEvent>((event, emit) {
      try {
        event.product.delete();
        add(const FetchAllProductEvent());
      } catch (e) {
        print('failed DeleteSpecificProductEvent: $e');
      }
    });

    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
