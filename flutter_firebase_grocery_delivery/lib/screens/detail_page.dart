import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// --- Colors & Styles ---
const Color kPrimaryGreen = Color(0xFF6AA84F);
const Color kLightGreenBackground = Color(0xFFF0F8F0);
const Color kDarkText = Color(0xFF263238); // Darker text color
const Color kLightGrey = Color(0xFFB0BEC5); // For secondary text/icons

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const ProductDetailPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    // Set status bar to dark icons for the light background
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    final String productName = item['name'] ?? 'Unknown';
    final String? productAsset = item['image'];
    final double productPrice = item['price']?.toDouble() ?? 20.00; // Default price

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              // 1. App Bar with Image & Green Back Button
              _SliverImageHeader(productAsset: productAsset),

              // 2. Main Content
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Product Info Block
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: _ProductInfoBlock(productName: productName),
                    ),

                    const SizedBox(height: 10),

                    // Quantity Selector (centered)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Center(child: _QuantitySelector()),
                    ),

                    const SizedBox(height: 30),

                    // Product Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: _ProductDescription(
                        description: item['description'] ??
                            'Freshly sourced ${productName.toLowerCase()}s, packed with nutrition and perfect for your daily needs.',
                      ),
                    ),
                    
                    // Spacer to ensure content scrolls above the fixed footer
                    const SizedBox(height: 120), 
                  ],
                ),
              ),
            ],
          ),

          // 3. Fixed Add to Cart Footer (Fixed layout to match original design)
          _AddToCartFooter(price: productPrice),
        ],
      ),
    );
  }
}

// --- 1. Sliver App Bar with Image & Green Back Button ---
class _SliverImageHeader extends StatelessWidget {
  final String? productAsset;

  const _SliverImageHeader({this.productAsset});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: kLightGreenBackground,
      expandedHeight: 280.0,
      pinned: true,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 1.0),
        child: FloatingActionButton.small(
          heroTag: 'back_btn',
          onPressed: () => Navigator.pop(context),
          backgroundColor: kPrimaryGreen,
          elevation: 2,
          child: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 40.0),
            child: Center(
              child: productAsset != null
                  ? Image.asset(
                      productAsset!,
                      fit: BoxFit.contain,
                      height: 180,
                      errorBuilder: (context, error, stackTrace) =>
                          const _PlaceholderImage(),
                    )
                  : const _PlaceholderImage(),
            ),
          ),
        ),
      ),
    );
  }
}

// Placeholder widget for the image header
class _PlaceholderImage extends StatelessWidget {
  const _PlaceholderImage();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.shopping_cart_outlined,
      size: 100,
      color: kPrimaryGreen,
    );
  }
}


// --- 2. Product Info Block (Unchanged) ---
class _ProductInfoBlock extends StatelessWidget {
  final String productName;

  const _ProductInfoBlock({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        // Product Name
        Text(
          productName,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w800,
            fontSize: 32,
            color: kDarkText,
          ),
        ),

        const SizedBox(height: 10),

        // Ratings and Delivery Time
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.star_rounded, color: Colors.amber, size: 22),
            SizedBox(width: 5),
            Text(
              '4.8',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: kDarkText,
              ),
            ),
            Text(
              ' (400 reviews)',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: kLightGrey,
              ),
            ),
            SizedBox(width: 25),
            Icon(Icons.access_time_rounded, color: kLightGrey, size: 22),
            SizedBox(width: 5),
            Text(
              '20 min',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: kDarkText,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}

// --- 3. Quantity Selector (Unchanged) ---
class _QuantitySelector extends StatefulWidget {
  const _QuantitySelector();

  @override
  State<_QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<_QuantitySelector> {
  int quantity = 1;

  void _updateQuantity(int delta) {
    setState(() {
      quantity = (quantity + delta).clamp(1, 10);
    });
  }

  // Helper method for the buttons
  Widget _buildButton(IconData icon, VoidCallback onPressed, {bool isMinus = false}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: isMinus ? Colors.white : kPrimaryGreen,
          border: Border.all(
            color: isMinus ? Colors.grey.shade300 : kPrimaryGreen,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isMinus ? kPrimaryGreen : Colors.white,
          size: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildButton(Icons.remove, () => _updateQuantity(-1), isMinus: true),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            '+ ${quantity}kg',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: kDarkText,
            ),
          ),
        ),
        _buildButton(Icons.add, () => _updateQuantity(1)),
      ],
    );
  }
}


// --- 4. Product Description (Unchanged) ---
class _ProductDescription extends StatelessWidget {
  final String description;

  const _ProductDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product Description',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: kDarkText,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            height: 1.6,
            color: Color(0xFF546E7A),
          ),
        ),
      ],
    );
  }
}


// --- 5. Add to Cart Footer (Modern Floating UI/UX) ---
class _AddToCartFooter extends StatefulWidget {
  final double price;

  const _AddToCartFooter({required this.price});

  @override
  State<_AddToCartFooter> createState() => _AddToCartFooterState();
}

class _AddToCartFooterState extends State<_AddToCartFooter> {
  int quantity = 1;

  void _updateQuantity(int delta) {
    setState(() {
      quantity = (quantity + delta).clamp(1, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 15,
      right: 15,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Quantity Selector

            const SizedBox(width: 15),

            // Price Display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [kPrimaryGreen.withOpacity(0.2), kPrimaryGreen.withOpacity(0.1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                '\$${(widget.price * quantity).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: kPrimaryGreen,
                ),
              ),
            ),

            const SizedBox(width: 15),

            // Add to Cart Button
            Expanded(
              child: SizedBox(
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${quantity} item(s) added to cart for \$${(widget.price * quantity).toStringAsFixed(2)}',
                        ),
                        backgroundColor: kPrimaryGreen,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  label: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
