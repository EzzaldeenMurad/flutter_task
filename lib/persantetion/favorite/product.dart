class Product {
  late String name;
  late String brand;
  late String color;
  late String size;
  late String price;
  late bool soldOut;
  late int discount;
  Product({
    required this.name,
    required this.brand,
    required this.color,
    required this.size,
    required this.price,
    required this.soldOut,
    required this.discount,
  });
}
