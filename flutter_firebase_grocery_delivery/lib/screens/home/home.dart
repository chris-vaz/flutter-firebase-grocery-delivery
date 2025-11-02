import 'package:flutter/material.dart';
import 'package:flutter_firebase_grocery_delivery/screens/detail_page.dart';

// --- App Colors ---
const Color kPrimaryGreen = Color(0xFF6AA84F);
const Color kLightGrey = Color(0xFFF3F3F3);

// --- Home Screen ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: _HomeHeader(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: _SearchBar(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: _DiscountBanner(),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 15),
              _CategoryList(),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Popular Fruits',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: _PopularItemsGrid(),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 1. Header ---
class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        Text(
          'Chris Vaz',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

// --- 2. Search Bar ---
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Grocery',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: kPrimaryGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.search, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }
}

// --- 3. Discount Banner ---
class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kPrimaryGreen,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: kPrimaryGreen.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left text
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '35% OFF',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Fresh deals every day!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Shop Now',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: kPrimaryGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Right illustration
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/banner_food.png',
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- 4. Categories ---
class _CategoryList extends StatelessWidget {
  const _CategoryList();

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Fruits', 'icon': Icons.food_bank, 'color': kPrimaryGreen},
    {'name': 'Dairy', 'icon': Icons.set_meal, 'color': Color(0xFFE5A869)},
    {'name': 'Veg', 'icon': Icons.grass, 'color': Color(0xFF90C290)},
    {'name': 'Meat', 'icon': Icons.local_dining, 'color': Color(0xFFC7C7C7)},
    {'name': 'Grains', 'icon': Icons.rice_bowl, 'color': Color(0xFF6AA84F)},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.only(left: 24),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: _CategoryCard(
              name: category['name'],
              icon: category['icon'],
              color: category['color'],
              isActive: index == 0,
            ),
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final bool isActive;

  const _CategoryCard({
    required this.name,
    required this.icon,
    required this.color,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: isActive ? kPrimaryGreen : Colors.transparent,
            border: Border.all(
              color: isActive ? kPrimaryGreen : Colors.grey.shade300,
              width: isActive ? 0 : 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: isActive ? Colors.white : color, size: 30),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isActive ? kPrimaryGreen : Colors.black87,
          ),
        ),
      ],
    );
  }
}

// --- 5. Popular Items ---
class _PopularItemsGrid extends StatelessWidget {
  const _PopularItemsGrid();

  final List<Map<String, dynamic>> products = const [
    {'name': 'Apple', 'price': 20.00, 'imageAsset': 'assets/images/apple.png'},
    {'name': 'Orange', 'price': 30.00, 'imageAsset': 'assets/images/orange.png'},
    {'name': 'Banana', 'price': 15.00, 'imageAsset': 'assets/images/banana.png'},
    {'name': 'Grapes', 'price': 25.00, 'imageAsset': 'assets/images/grapes.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  item: {
                    'name': product['name'],
                    'price': product['price'],
                    'image': product['imageAsset'], // <-- send correct key
                  },
                ),
              ),
            );
          },
          child: _ProductCard(
            name: product['name'],
            price: product['price'],
            imageAsset: product['imageAsset'],
          ),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String imageAsset;

  const _ProductCard({
    required this.name,
    required this.price,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.fastfood,
                    size: 60,
                    color: kPrimaryGreen.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 5),
            child: Text(
              name,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 15),
            child: Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: kPrimaryGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
