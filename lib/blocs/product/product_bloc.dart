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
        product!.code = event.code;
        product!.barcode = event.barcode;
        product!.unitOfMeasurement = event.unitOfMeasurement;
        product!.group = event.group;
        product!.isActive = event.isActive;
        product!.isDefaultQuantity = event.isDefaultQuantity;
        product!.isService = event.isService;
        product!.age = event.age;
        product!.description = event.description;
        product!.cost = event.cost;
        product!.markup = event.markup;
        product!.salePrice = event.salePrice;
        product!.doesPriceIncludeTax = event.doesPriceIncludeTax;
        product!.isPriceChangeAllowed = event.isPriceChangeAllowed;
        product!.supplier = event.supplier;
        product!.reorderPoint = event.reorderPoint;
        product!.preferredQuantity = event.preferredQuantity;
        product!.lowStockWarning = event.lowStockWarning;
        product!.lowStockWarningQuantity = event.lowStockWarningQuantity;

        product!.color = event.color;
        product!.image = event.image;
        product!.comments = event.comments;

        product!.save();
        add(const FetchAllProductEvent());
      } catch (e) {
        print('failed UpdateSpecificProductEvent: $e');
      }
    });

    on<DeleteAllProductsEvent>((event, Emit) async {
      try {
        final box = Boxes.getProducts();

        await box.clear();

        add(const FetchAllProductEvent());
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
