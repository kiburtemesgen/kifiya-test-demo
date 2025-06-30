
part of '../favorite_screen.dart';

class _FavoriteItem extends StatelessWidget {
  const _FavoriteItem({
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
