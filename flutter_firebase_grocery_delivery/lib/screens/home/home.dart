import 'package:flutter/material.dart';

// --- Colors & Styles ---
// Custom primary green color derived from the images
const Color kPrimaryGreen = Color(0xFF6AA84F);

// Custom light gray for text fields and backgrounds
const Color kLightGrey = Color(0xFFF3F3F3);

// Main Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // No AppBar, as the content starts right from the top (under the status bar)
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1. Header (Welcome and User Name)
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: _HomeHeader(),
              ),

              // 2. Search Bar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: _SearchBar(),
              ),

              // 3. Discount Banner Carousel
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: _DiscountBanner(),
              ),

              const SizedBox(height: 30),

              // 4. Categories Section Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Catagories', // Note: Retaining the misspelling "Catagories" from the image for accuracy
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // 5. Category List (Horizontal Scroll)
              const _CategoryList(),

              const SizedBox(height: 30),

              // 6. Popular Items Section Title
              const Padding(
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

              const SizedBox(height: 15),

              // 7. Popular Items Grid
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: _PopularItemsGrid(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// --- 1. Header Widget ---
class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "Welcome"
        Text(
          'Welcome',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        // User Name
        Text(
          'Chris Vaz', // Placeholder name
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

// --- 2. Search Bar Widget ---
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(15), // Slightly rounded corners
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
          // Search Icon Button
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

// --- 3. Discount Banner Widget ---
class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner();

  @override
  Widget build(BuildContext context) {
    // The banner background is a large green rounded rectangle
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kPrimaryGreen,
        borderRadius: BorderRadius.circular(25),
        // Subtle shadow to mimic the image's look
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Text content
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
                  'Lorem ipsum dolor sit amet, consectetur',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 10),
                // Shop Now Button (looks like a secondary button in the image)
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
          // Right side: Illustration (placeholder)
          Expanded(
            flex: 5,
            child: Center(
              // Using an empty container or a simple widget as a placeholder for the food illustration
              child: Container(
                // In a real project, this would be an Image.asset or illustration widget
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner_food.png'),
                    fit: BoxFit.contain,
                    // Error builder fallback is crucial here for the placeholder image
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- 4. Category List Widget (Horizontal ScrollView) ---
class _CategoryList extends StatelessWidget {
  const _CategoryList();

  // Mock data for categories matching the image
  final List<Map<String, dynamic>> categories = const [
    {'name': 'Fruits', 'icon': Icons.food_bank, 'color': kPrimaryGreen},
    {'name': 'Dairy', 'icon': Icons.set_meal, 'color': Color(0xFFE5A869)},
    {'name': 'Veg', 'icon': Icons.grass, 'color': Color(0xFF90C290)},
    {'name': 'Meat', 'icon': Icons.local_dining, 'color': Color(0xFFC7C7C7)},
    {
      'name': 'Grains',
      'icon': Icons.rice_bowl,
      'color': Color(0xFF6AA84F),
    }, // Additional Category
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Fixed height for horizontal list
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
              isActive: index == 0, // 'Fruits' is active in the image
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
        // Icon Container
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: isActive
                ? kPrimaryGreen
                : Colors.transparent, // Active card has solid background
            border: Border.all(
              color: isActive ? kPrimaryGreen : Colors.grey.shade300,
              width: isActive ? 0 : 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: isActive ? Colors.white : color, size: 30),
        ),
        const SizedBox(height: 5),
        // Name Text
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

// --- 5. Popular Items Grid Widget ---
class _PopularItemsGrid extends StatelessWidget {
  const _PopularItemsGrid();

  // Mock product data
  final List<Map<String, dynamic>> products = const [
    {'name': 'Apple', 'price': 20.00, 'imageAsset': 'assets/images/apple.png'},
    {
      'name': 'Orange',
      'price': 30.00,
      'imageAsset': 'assets/images/orange.png',
    },
    {
      'name': 'Banana',
      'price': 15.00,
      'imageAsset': 'assets/images/banana.png',
    },
    {
      'name': 'Grapes',
      'price': 25.00,
      'imageAsset': 'assets/images/grapes.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Use GridView.builder to create the two-column layout shown in the image
    return GridView.builder(
      shrinkWrap: true, // Crucial for embedding in a SingleChildScrollView
      physics:
          const NeverScrollableScrollPhysics(), // Prevent grid from scrolling
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75, // Adjust height vs width for the card style
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return _ProductCard(
          name: product['name'],
          price: product['price'],
          imageAsset: product['imageAsset'],
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
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Area
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.contain,
                  // Fallback icon for the placeholder image if the asset isn't found
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.rice_bowl, // fruit/food-themed alternative
                    size: 60,
                    color: kPrimaryGreen,
                  ),
                ),
              ),
            ),
          ),

          // Product Name
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

          // Product Price
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 15),
            child: Text(
              '\$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: kPrimaryGreen, // Green price text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
