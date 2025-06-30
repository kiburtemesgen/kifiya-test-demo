import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kifiya_test/data/models/product_model.dart';
import 'package:kifiya_test/presentation/authentication/auth_bloc/auth_bloc.dart';
import 'package:kifiya_test/presentation/authentication/login_screen.dart';
import 'package:kifiya_test/presentation/product/blocs/favorite/favorite_bloc/favorite_bloc.dart';
import 'package:kifiya_test/presentation/product/blocs/product/product_bloc/product_bloc.dart';
import 'package:kifiya_test/presentation/product/blocs/favorite/favorite_screen.dart';

part './widgets/product_item.dart';

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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: OutlinedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthEvent.logout());
              },
              child: Text('Logout'),
            ),
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
                                    FavoriteEvent.addToFavorite(
                                      product: product,
                                    ),
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
      ),
    );
  }
}
