import 'package:flutter/material.dart';
import 'screen/home_screen.dart';
import 'screen/product_detail_screen.dart';
import 'screen/products_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, this.deepLink});

  final String? deepLink;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [const HomeScreen(), const ProductsScreen()];

  @override
  void initState() {
    super.initState();
    // await ProductRepository.loadProducts();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleDeepLink();
    });
  }

  void _handleDeepLink() {
    final deepLink = widget.deepLink;
    if (deepLink == null) return;

    final uri = Uri.tryParse(deepLink);
    if (uri == null) return;

    final path = uri.path;
    debugPrint("product path::: $path");
    final params = uri.queryParameters;
    final productId = int.tryParse(params['productId'] ?? '');

    if (path.contains('products')) {
      debugPrint('Navigating to Products Screen');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProductsScreen()),
      );
    }
    // Deep Link → Open Product Details
    // Example: https://dp-link.vercel.app/product_details?productId=4
    if (path.contains('product_details') && productId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailScreen(productId: productId),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
        ],
      ),
    );
  }
}
