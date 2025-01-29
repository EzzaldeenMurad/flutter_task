import 'package:flutter/material.dart';

class Shopping extends StatelessWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopBar(),
                const SizedBox(height: 24),
                buildCashback(),
                const SizedBox(height: 24),
                buildServices(),
                const SizedBox(height: 24),
                buildSectionTitle("Special for you"),
                buildSpecialCategory(),
                const SizedBox(height: 24),
                buildSectionTitle("Popular Product"),
                buildPopularProducts(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildTopBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xffe5e5e6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Color(0xff503b96)),
                SizedBox(width: 8),
                Text(
                  'Search for products...',
                  style: TextStyle(color: Color(0xff503b96)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color(0xffe5e5e6),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: Color(0xff503b96),
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 8),
        Badge(
            label: const Text('3', style: TextStyle(color: Colors.white)),
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffe5e5e6),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  color: Color(0xff503b96),
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ))),
      ],
    );
  }

  Widget buildCashback() {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff4f3a95),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "A Summer Surprise",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 7),
          Text(
            "Cashback 20%",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Column(
          children: [
            Icon(Icons.flash_on, size: 32, color: Colors.purple),
            const SizedBox(height: 4),
            Text("Flash Deal", style: const TextStyle(fontSize: 12)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.receipt, size: 32, color: Colors.purple),
            const SizedBox(height: 4),
            Text("Bill", style: const TextStyle(fontSize: 12)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.games_outlined, size: 32, color: Colors.purple),
            const SizedBox(height: 4),
            Text("Game", style: const TextStyle(fontSize: 12)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.card_giftcard, size: 32, color: Colors.purple),
            const SizedBox(height: 4),
            Text("Daily Gift", style: const TextStyle(fontSize: 12)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.card_giftcard, size: 32, color: Colors.purple),
            const SizedBox(height: 4),
            Text("Daily Gift", style: const TextStyle(fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("See More"),
          ),
        ],
      ),
    );
  }

  Widget buildSpecialCategory() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return buildCategoryCard("Smartphone", "18 Brands");
        },
      ),
    );
  }

  Widget buildPopularProducts() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return buildProductCard(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/logo.jpg",
                      width: 120, height: 180, fit: BoxFit.cover)));
        },
      ),
    );
  }

  Widget buildCategoryCard(String title, String subtitle) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
        image: const DecorationImage(
          image: AssetImage("assets/images/logo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard({Widget? child}) {
    return Container(
      width: 120,
      height: 200,
      margin: const EdgeInsets.only(left: 16),
      child: Center(child: child ?? const Icon(Icons.videogame_asset)),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.account_circle_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}
