
part of '../product_screen.dart';

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
