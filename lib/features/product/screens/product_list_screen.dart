import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:bike_shoping_app/core/constants/enums.dart';
import 'package:bike_shoping_app/core/utils/widgets/custom_searchbtn.dart';
import 'package:bike_shoping_app/features/product/screens/su.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/copies.dart';
import '../controllers/product_controller.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Su(),
    Text('Categories Page',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: AppColors.white)),
    Text('Wishlist Page',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: AppColors.white)),
    Text('Profile Page',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: AppColors.white)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productData = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        actions:  [CustomSearchButton(passvalue: true,)],
        title: Copies.appbarnamewidget,
      ),

      body: _widgetOptions
          .elementAt(_selectedIndex), // Switching based on the selected index
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        backgroundColor: AppColors.blue.withOpacity(0.8),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: getBottomIcon(BottomNavItem.home),
            label: getBottonName(BottomNavItem.home),
            backgroundColor: AppColors.blue,
          ),
          BottomNavigationBarItem(
            icon: getBottomIcon(BottomNavItem.categories),
            label: getBottonName(BottomNavItem.categories),
            backgroundColor: AppColors.blue,
          ),
          BottomNavigationBarItem(
            icon: getBottomIcon(BottomNavItem.wishlist),
            label: getBottonName(BottomNavItem.wishlist),
            backgroundColor: AppColors.blue,
          ),
          BottomNavigationBarItem(
            icon: getBottomIcon(BottomNavItem.profile),
            label: getBottonName(BottomNavItem.profile),
            backgroundColor: AppColors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.skyblue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Icon getBottomIcon(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.home:
        return const Icon(Icons.home);
      case BottomNavItem.categories:
        return const Icon(Icons.category);
      case BottomNavItem.wishlist:
        return const Icon(Icons.favorite);
      case BottomNavItem.profile:
        return const Icon(Icons.person);
      default:
        return const Icon(Icons.error); // Fallback icon
    }
  }

  String getBottonName(BottomNavItem item) {
    switch (item) {
      case BottomNavItem.home:
        return Copies.home;
      case BottomNavItem.categories:
        return Copies.categories;
      case BottomNavItem.wishlist:
        return Copies.wishlist;
      case BottomNavItem.profile:
        return Copies.profile;
      default:
        return "Error"; // Fallback label
    }
  }
}
