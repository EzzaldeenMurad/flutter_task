class Product {
  final String title, image;
  final double price;
  Product(
      {required this.title,
      // required this.description,
      required this.price,
      required this.image});

  factory Product.fromAPI(Map<String, dynamic> items) {
    return Product(
        title: items['title'],
        // description: items['description'],
        price: items['price'],
        image: items['thumbnail']);
  }
}
