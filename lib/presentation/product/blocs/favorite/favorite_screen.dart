import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kifiya_test/data/models/product_model.dart';
import 'package:kifiya_test/presentation/product/blocs/favorite/favorite_bloc/favorite_bloc.dart';

part './widgets/favorite_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text('Favorites'),
                  ],
                ),
                if (state.favorites.isEmpty)
                  Center(child: Text('Your Favorite is empty')),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      final product = state.favorites[index];

                      return _FavoriteItem(
                        removeFavorite: () {
                          context.read<FavoriteBloc>().add(
                            FavoriteEvent.removeFavorite(product: product),
                          );
                        },
                        product: product,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
