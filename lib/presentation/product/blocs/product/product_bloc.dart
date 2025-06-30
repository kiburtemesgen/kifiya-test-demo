import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kifiya_test/data/models/product_model.dart';
import 'package:kifiya_test/data/repositories/product_repository.dart';

part 'product_state.dart';
part 'product_event.dart';
part 'product_bloc.freezed.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductRepository repository;
  final FlutterSecureStorage storage;
  ProductBloc(this.repository, this.storage)
    : super(const ProductState.productLoading()) {
    on<_GetProducts>(_getProducts);
  }

  FutureOr<void> _getProducts(
    _GetProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductState.productLoading());
    await Future.delayed(Duration(seconds: 2));
    final response = await repository.getProducts();
    print('the repsonse from product: $response');
    emit(ProductState.productSuccess(products: response));
  }


}
