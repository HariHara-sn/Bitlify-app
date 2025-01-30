// import 'package:bike_shoping_app/core/constants/colors.dart';
// import 'package:bike_shoping_app/core/constants/copies.dart';
// import 'package:bike_shoping_app/core/constants/enums.dart';
// import 'package:bike_shoping_app/features/product/screens/shopping_cart_screen.dart';
// import 'package:flutter/material.dart';

// class Bottomnavigationbar extends StatelessWidget {
//   final int selectedIndex;
//   final void Function(int) onItemTapped;
//   const Bottomnavigationbar(
//       {required this.selectedIndex, required this.onItemTapped, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       elevation: 8,
//       backgroundColor: AppColors.blue.withOpacity(0.8),
      
      
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: getBottomIcon(BottomNavItem.home),
//           label: getBottonName(BottomNavItem.home),
//           backgroundColor: AppColors.blue,
//         ),
//         BottomNavigationBarItem(
//           icon: getBottomIcon(BottomNavItem.categories),
//           label: getBottonName(BottomNavItem.categories),
//           backgroundColor: AppColors.blue,
//         ),
//         BottomNavigationBarItem(
//           icon: getBottomIcon(BottomNavItem.wishlist),
//           label: getBottonName(BottomNavItem.wishlist),
//           backgroundColor: AppColors.blue,
//         ),
//         BottomNavigationBarItem(
//           icon: getBottomIcon(BottomNavItem.profile),
//           label: getBottonName(BottomNavItem.profile),
//           backgroundColor: AppColors.blue,
//         ),
//       ],
//       currentIndex: selectedIndex,
//       selectedItemColor: AppColors.skyblue,
//       unselectedItemColor: Colors.grey,
//       onTap: (index) {
//         onItemTapped(index);
//         if (index == 1) {
//           Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
//           );
//         }
//       },
//     );
//   }
// }

// Icon getBottomIcon(BottomNavItem item) {
//   switch (item) {
//     case BottomNavItem.home:
//       return const Icon(Icons.home);
//     case BottomNavItem.categories:
//       return const Icon(Icons.category);
//     case BottomNavItem.wishlist:
//       return const Icon(Icons.favorite);
//     case BottomNavItem.profile:
//       return const Icon(Icons.person);
//   }
// }

// String getBottonName(BottomNavItem item) {
//   switch (item) {
//     case BottomNavItem.home:
//       return Copies.home;
//     case BottomNavItem.categories:
//       return Copies.categories;
//     case BottomNavItem.wishlist:
//       return Copies.wishlist;
//     case BottomNavItem.profile:
//       return Copies.profile;
//   }
// }
