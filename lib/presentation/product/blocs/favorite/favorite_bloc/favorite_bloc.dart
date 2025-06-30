import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kifiya_test/data/models/product_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FlutterSecureStorage storage;
  FavoriteBloc(this.storage) : super(FavoriteState.favoriteInitial()) {
    on<_AddToFavorite>(_addToFavorite);
    on<_RemoveFavorite>(_removeFavorite);
  }

  Future<void> _addToFavorite(
    _AddToFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final newFavorites = [...state.favorites, event.product];
    emit(state.copyWith(favorites: newFavorites));
  }

  Future<void> _removeFavorite(
    _RemoveFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final productId = event.product.id;
    final newList = List<ProductModel>.from(state.favorites);
    newList.removeWhere((product) => product.id == productId);
    emit(state.copyWith(favorites: newList));
  }
}
