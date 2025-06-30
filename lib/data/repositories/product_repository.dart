import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kifiya_test/data/models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProducts();
}

@Injectable(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final Dio dio;

  ProductRepository(this.dio);
  @override
  Future<List<ProductModel>> getProducts() async {
    // final productJson = [
    //   {
    //     "id": 101,
    //     "title": "Ergonomic Office Chair",
    //     "price": 249.99,
    //     "description":
    //         "High-back ergonomic office chair with adjustable lumbar support and breathable mesh fabric. Perfect for long working hours.",
    //     "category": "Office Furniture",
    //     "image": "http://example.com/images/chair101.jpg",
    //   },
    //   {
    //     "id": 102,
    //     "title": "Noise-Cancelling Headphones",
    //     "price": 199.00,
    //     "description":
    //         "Premium wireless headphones with active noise cancellation, deep bass, and comfortable over-ear design. Up to 30 hours battery life.",
    //     "category": "Electronics",
    //     "image": "http://example.com/images/headphones102.jpg",
    //   },
    //   {
    //     "id": 103,
    //     "title": "Stainless Steel Water Bottle",
    //     "price": 25.50,
    //     "description":
    //         "24oz insulated stainless steel water bottle. Keeps drinks cold for 24 hours and hot for 12 hours. BPA-free.",
    //     "category": "Kitchen & Dining",
    //     "image": "http://example.com/images/bottle103.jpg",
    //   },
    //   {
    //     "id": 104,
    //     "title": "Smart LED Desk Lamp",
    //     "price": 59.95,
    //     "description":
    //         "Dimmable LED desk lamp with multiple color temperature settings and touch controls. Compatible with smart home assistants.",
    //     "category": "Home Decor",
    //     "image": "http://example.com/images/lamp104.jpg",
    //   },
    //   {
    //     "id": 105,
    //     "title": "Organic Green Tea Blend",
    //     "price": 12.75,
    //     "description":
    //         "A soothing blend of organic green tea leaves with hints of jasmine and mint. 20 biodegradable tea bags.",
    //     "category": "Groceries",
    //     "image": "http://example.com/images/tea105.jpg",
    //   },
    //   {
    //     "id": 106,
    //     "title": "Portable Bluetooth Speaker",
    //     "price": 75.00,
    //     "description":
    //         "Compact and powerful Bluetooth speaker with rich stereo sound and 10-hour battery life. Water-resistant design.",
    //     "category": "Electronics",
    //     "image": "http://example.com/images/speaker106.jpg",
    //   },
    //   {
    //     "id": 107,
    //     "title": "Yoga Mat with Carrying Strap",
    //     "price": 35.00,
    //     "description":
    //         "Eco-friendly, non-slip yoga mat made from natural rubber. Includes a durable carrying strap for easy transport.",
    //     "category": "Sports & Outdoors",
    //     "image": "http://example.com/images/yogamat107.jpg",
    //   },
    //   {
    //     "id": 108,
    //     "title": "Classic Leather Wallet",
    //     "price": 45.00,
    //     "description":
    //         "Handcrafted genuine leather wallet with multiple card slots, a bill compartment, and an ID window. Slim design.",
    //     "category": "Accessories",
    //     "image": "http://example.com/images/wallet108.jpg",
    //   },
    //   {
    //     "id": 109,
    //     "title": "Gourmet Coffee Beans",
    //     "price": 18.99,
    //     "description":
    //         "12oz bag of ethically sourced, single-origin Arabica coffee beans. Medium roast with notes of chocolate and citrus.",
    //     "category": "Groceries",
    //     "image": "http://example.com/images/coffee109.jpg",
    //   },
    //   {
    //     "id": 110,
    //     "title": "Artisan Ceramic Mug Set",
    //     "price": 30.00,
    //     "description":
    //         "Set of two handmade ceramic mugs with unique glaze finishes. Perfect for coffee, tea, or hot cocoa.",
    //     "category": "Kitchen & Dining",
    //     "image": "http://example.com/images/mugset110.jpg",
    //   },
    // ];

     final response = await dio.get('products');
     print('the reponse from dio: ${response.data}');
     final result = response.data as List<dynamic>;
     

    return result.map((json) => ProductModel.fromJson(json)).toList();
  }
}
