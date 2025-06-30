// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'isFavorite': instance.isFavorite,
    };

_ProductList _$ProductListFromJson(Map<String, dynamic> json) => _ProductList(
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductListToJson(_ProductList instance) =>
    <String, dynamic>{'products': instance.products};
