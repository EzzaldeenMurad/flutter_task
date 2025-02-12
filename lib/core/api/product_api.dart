import 'package:dio/dio.dart';
import 'package:flutter_task/core/models/product.dart';

class ProductAPI {
  final dio = Dio();

  Future<List<Product>> getProducts() async {
    Response response = await dio.get('https://dummyjson.com/products');

    if (response.statusCode == 200) {
      List<dynamic> allProducts = response.data['products'];
      List<Product> products =
          allProducts.map((e) => Product.fromAPI(e)).toList();
      // print(products[0].title);
      return products;
    }

    return [];
  }
}
