import 'package:flutter/material.dart';
import 'package:flutter_task/favorite/product.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  List<Product> products = [
    Product(
      name: 'Shirt',
      brand: 'LIME',
      color: 'Blue',
      size: 'L',
      price: '\$10',
      soldOut: false,
      discount: 0,
    ),
    Product(
      name: 'Longsleeve Violeta',
      brand: 'Mango',
      color: 'Orange',
      size: 'S',
      price: '\$46',
      soldOut: false,
      discount: 0,
    ),
    Product(
      name: 'Shirt',
      brand: 'Olivier',
      color: 'Gray',
      size: 'L',
      price: '\$52',
      soldOut: true,
      discount: 0,
    ),
    Product(
      name: 'T-Shirt',
      brand: '8Berries',
      color: 'Black',
      size: 'S',
      price: '\$55',
      soldOut: false,
      discount: 30,
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _buildFilterButton('Summer', Colors.black);
                  }),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Row(
              children: [
                Icon(Icons.filter_list),
                SizedBox(
                  width: 5,
                ),
                Text('Filter')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Price: lowest to high'),
                Icon(Icons.arrow_drop_down),
              ],
            ),
            Icon(Icons.grid_view_rounded)
          ]),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.6,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Shop'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String title, Color color) {
    return Container(
      width: 120,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xfffaf8f9),
          boxShadow: [
            BoxShadow(
              color: Color(0xfffaf8f9),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Row(
                    children: List.generate(
                        5,
                        (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            )),
                  ),
                  const SizedBox(width: 4),
                  const Text("(10)",
                      style: TextStyle(fontSize: 12, color: Colors.grey))
                ],
              ),
              Text(product.brand, style: TextStyle(fontSize: 12)),
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(children: [
                Text(
                  "Color: ${product.color}",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                SizedBox(width: 15),
                Text(
                  "Size: ${product.size}",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ]),
              Row(
                children: [
                  Text(
                    product.price,
                    style: TextStyle(
                      color: product.discount > 0 ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    product.discount > 0 ? '${product.discount}%' : '',
                    style: TextStyle(
                      color: product.discount > 0 ? Colors.red : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (!product.soldOut)
            Positioned(
              bottom: 50,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onPressed: () {},
                ),
              ),
            ),
          if (product.soldOut)
            Positioned(
              bottom: 75,
              child: Container(
                width: 185,
                height: 50,
                padding: const EdgeInsets.all(2),
                color: Colors.black54,
                child: Text(
                  'Sorry, this item is currently sold out',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (product.discount > 0)
            Positioned(
              top: 10,
              right: 120,
              child: Container(
                width: 50,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  '${product.discount}%',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
