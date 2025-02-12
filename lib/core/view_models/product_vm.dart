import 'package:flutter_task/core/api/product_api.dart';

class ProductVM {
  ProductAPI api = ProductAPI();
  getAllProducts() {
   return api.getProducts();
  }
}
