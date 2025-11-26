import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'screen/products_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, this.deepLink});

  final String? deepLink;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.deepLink != null && context.mounted) {
        debugPrint('Handling deep link: ${widget.deepLink}');

        if (widget.deepLink!.contains('product_screen')) {
          debugPrint('Pushing Offer Screen from NavigationScreen');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductsScreen()),
          );
        } else if (widget.deepLink!.contains('profile_details_screen')) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ProductDetailScreen()),
          // );
        }
      }
    });
  }

  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProductsScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
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