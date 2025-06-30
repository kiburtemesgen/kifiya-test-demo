import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  factory ProductModel({
    required int id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    @Default(false) bool isFavorite,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
abstract class ProductList with _$ProductList {
  const factory ProductList({required List<ProductModel> products}) =
      _ProductList;

  factory ProductList.fromJson(Map<String, Object?> json) =>
      _$ProductListFromJson(json);
}
