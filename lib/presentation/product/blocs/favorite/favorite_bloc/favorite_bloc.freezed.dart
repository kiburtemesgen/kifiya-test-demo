// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteEvent {

 ProductModel get product;
/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteEventCopyWith<FavoriteEvent> get copyWith => _$FavoriteEventCopyWithImpl<FavoriteEvent>(this as FavoriteEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteEvent&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'FavoriteEvent(product: $product)';
}


}

/// @nodoc
abstract mixin class $FavoriteEventCopyWith<$Res>  {
  factory $FavoriteEventCopyWith(FavoriteEvent value, $Res Function(FavoriteEvent) _then) = _$FavoriteEventCopyWithImpl;
@useResult
$Res call({
 ProductModel product
});


$ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class _$FavoriteEventCopyWithImpl<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  _$FavoriteEventCopyWithImpl(this._self, this._then);

  final FavoriteEvent _self;
  final $Res Function(FavoriteEvent) _then;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,
  ));
}
/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc


class _AddToFavorite implements FavoriteEvent {
  const _AddToFavorite({required this.product});
  

@override final  ProductModel product;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddToFavoriteCopyWith<_AddToFavorite> get copyWith => __$AddToFavoriteCopyWithImpl<_AddToFavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddToFavorite&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'FavoriteEvent.addToFavorite(product: $product)';
}


}

/// @nodoc
abstract mixin class _$AddToFavoriteCopyWith<$Res> implements $FavoriteEventCopyWith<$Res> {
  factory _$AddToFavoriteCopyWith(_AddToFavorite value, $Res Function(_AddToFavorite) _then) = __$AddToFavoriteCopyWithImpl;
@override @useResult
$Res call({
 ProductModel product
});


@override $ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class __$AddToFavoriteCopyWithImpl<$Res>
    implements _$AddToFavoriteCopyWith<$Res> {
  __$AddToFavoriteCopyWithImpl(this._self, this._then);

  final _AddToFavorite _self;
  final $Res Function(_AddToFavorite) _then;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(_AddToFavorite(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,
  ));
}

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

/// @nodoc


class _RemoveFavorite implements FavoriteEvent {
  const _RemoveFavorite({required this.product});
  

@override final  ProductModel product;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveFavoriteCopyWith<_RemoveFavorite> get copyWith => __$RemoveFavoriteCopyWithImpl<_RemoveFavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveFavorite&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'FavoriteEvent.removeFavorite(product: $product)';
}


}

/// @nodoc
abstract mixin class _$RemoveFavoriteCopyWith<$Res> implements $FavoriteEventCopyWith<$Res> {
  factory _$RemoveFavoriteCopyWith(_RemoveFavorite value, $Res Function(_RemoveFavorite) _then) = __$RemoveFavoriteCopyWithImpl;
@override @useResult
$Res call({
 ProductModel product
});


@override $ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class __$RemoveFavoriteCopyWithImpl<$Res>
    implements _$RemoveFavoriteCopyWith<$Res> {
  __$RemoveFavoriteCopyWithImpl(this._self, this._then);

  final _RemoveFavorite _self;
  final $Res Function(_RemoveFavorite) _then;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(_RemoveFavorite(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,
  ));
}

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

/// @nodoc
mixin _$FavoriteState {

 List<ProductModel> get favorites;
/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStateCopyWith<FavoriteState> get copyWith => _$FavoriteStateCopyWithImpl<FavoriteState>(this as FavoriteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState&&const DeepCollectionEquality().equals(other.favorites, favorites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(favorites));

@override
String toString() {
  return 'FavoriteState(favorites: $favorites)';
}


}

/// @nodoc
abstract mixin class $FavoriteStateCopyWith<$Res>  {
  factory $FavoriteStateCopyWith(FavoriteState value, $Res Function(FavoriteState) _then) = _$FavoriteStateCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> favorites
});




}
/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._self, this._then);

  final FavoriteState _self;
  final $Res Function(FavoriteState) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? favorites = null,}) {
  return _then(_self.copyWith(
favorites: null == favorites ? _self.favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}

}


/// @nodoc


class FavoritesInitial implements FavoriteState {
  const FavoritesInitial({final  List<ProductModel> favorites = const []}): _favorites = favorites;
  

 final  List<ProductModel> _favorites;
@override@JsonKey() List<ProductModel> get favorites {
  if (_favorites is EqualUnmodifiableListView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favorites);
}


/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritesInitialCopyWith<FavoritesInitial> get copyWith => _$FavoritesInitialCopyWithImpl<FavoritesInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesInitial&&const DeepCollectionEquality().equals(other._favorites, _favorites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favorites));

@override
String toString() {
  return 'FavoriteState.favoriteInitial(favorites: $favorites)';
}


}

/// @nodoc
abstract mixin class $FavoritesInitialCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $FavoritesInitialCopyWith(FavoritesInitial value, $Res Function(FavoritesInitial) _then) = _$FavoritesInitialCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> favorites
});




}
/// @nodoc
class _$FavoritesInitialCopyWithImpl<$Res>
    implements $FavoritesInitialCopyWith<$Res> {
  _$FavoritesInitialCopyWithImpl(this._self, this._then);

  final FavoritesInitial _self;
  final $Res Function(FavoritesInitial) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? favorites = null,}) {
  return _then(FavoritesInitial(
favorites: null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

// dart format on
