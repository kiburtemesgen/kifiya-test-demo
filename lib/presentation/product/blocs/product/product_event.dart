part of 'product_bloc.dart';

@freezed
abstract class ProductEvent with _$ProductEvent {
  factory ProductEvent.getProducts() = _GetProducts;
}
