import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kifiya_test/data/models/product_model.dart';
import 'package:kifiya_test/presentation/product/blocs/favorite/favorite_bloc/favorite_bloc.dart';

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

class _FavoriteItem extends StatelessWidget {
  const _FavoriteItem({
    super.key,
    required this.product,
    required this.removeFavorite,
  });
  final ProductModel product;
  final Function() removeFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title ?? ""),
                Text(product.price.toString()),
                Text(product.description ?? ""),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: removeFavorite,
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
