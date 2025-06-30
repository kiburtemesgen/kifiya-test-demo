part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.addToFavorite({required ProductModel product}) =
      _AddToFavorite;
  const factory FavoriteEvent.removeFavorite({required ProductModel product}) =
      _RemoveFavorite;
}
