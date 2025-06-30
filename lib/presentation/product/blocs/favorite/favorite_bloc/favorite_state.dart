part of 'favorite_bloc.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState.favoriteInitial({
    @Default([]) List<ProductModel> favorites,
  }) = FavoritesInitial;
}
