import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;
  const Bottomnavigationbar({required this.selectedIndex,required this.onItemTapped ,super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 8,
        backgroundColor: AppColors.blue.withOpacity(0.8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppColors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            backgroundColor: AppColors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
            backgroundColor: AppColors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: AppColors.blue,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.skyblue,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      );
  }
}