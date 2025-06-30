import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kifiya_test/data/models/product_model.dart';
import 'package:kifiya_test/presentation/product/blocs/favorite/favorite_bloc.dart';
import 'package:kifiya_test/presentation/product/blocs/product/product_bloc.dart';
import 'package:kifiya_test/presentation/product/favorite_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEvent.getProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: (state is ProductLoading)
                ? Center(child: CircularProgressIndicator())
                : (state is ProductSuccess)
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Products'),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FavoriteScreen(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text("Favorites"),
                                  Icon(Icons.favorite, color: Colors.red),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.products.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            final List<ProductModel> favorites = context
                                .watch<FavoriteBloc>()
                                .state
                                .favorites;
                            ProductModel? foundFavorite = favorites
                                .firstWhereOrNull(
                                  (favorite) => favorite.id == product.id,
                                );
                            return _ProductItem(
                              isFavorite: foundFavorite != null,
                              product: product,
                              onFavorite: () {
                                context.read<FavoriteBloc>().add(
                                  FavoriteEvent.addToFavorite(product: product),
                                );
                                const snackBar = SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  content: Text(
                                    'You have sucessfully added your product',
                                  ),
                                );

                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(snackBar);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Center(child: Text("Error")),
          ),
        );
      },
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({
    super.key,
    required this.product,
    required this.onFavorite,
    required this.isFavorite,
  });
  final ProductModel product;
  final Function() onFavorite;
  final bool isFavorite;

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
                    onPressed: onFavorite,
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
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
