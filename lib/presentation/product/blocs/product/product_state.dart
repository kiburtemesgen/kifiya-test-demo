part of 'product_bloc/product_bloc.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState.productInitial() = ProductInitial;
  const factory ProductState.productLoading() = ProductLoading;
  const factory ProductState.productSuccess({
    required List<ProductModel> products,

  }) = ProductSuccess;
  const factory ProductState.productError() = ProductError;
}
