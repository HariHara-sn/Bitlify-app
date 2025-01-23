import 'dart:ui';
import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:bike_shoping_app/core/constants/images.dart';
import 'package:bike_shoping_app/core/constants/styles.dart';
import 'package:bike_shoping_app/core/utils/error_screen.dart';
import 'package:bike_shoping_app/core/utils/widgets/custom_neobutton.dart';
import 'package:bike_shoping_app/core/utils/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/copies.dart';
import '../controllers/product_controller.dart';

class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (_controller.isAnimating) return;
    _controller.forward(from: 0.0);
  }

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
        backgroundColor: AppColors.blue,
        titleTextStyle: AppStyles.customStyle,
        toolbarHeight: 100,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.skyblue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Icon(
                Icons.search_rounded,
                size: 40,
                color: AppColors.white,
              ),
            ),
          ),
        ],
        title: Copies.appbarname,
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.rectangle,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 225,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundBlur.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border:
                          Border.all(width: 1, color: const Color(0xFF353F54)),
                      boxShadow: const <BoxShadow>[],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          right: 20,
                          left: 20,
                          child: GestureDetector(
                            onTap: _onTap,
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * 3.14159265359,
                                  child: child,
                                );
                              },
                              child: Image.asset(
                                AppImages.bikeImage,
                                height: 160,
                                width: 330,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                            bottom: 16, left: 16, child: Copies.offer),
                      ],
                    ),
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomNeobutton(
                        img: AppImages.boltImage,
                      ),
                      CustomNeobutton(
                        img: AppImages.unionImage,
                      ),
                      CustomNeobutton(
                        img: AppImages.coneImage,
                      ),
                      CustomNeobutton(
                        img: AppImages.helmetImage,
                      ),
                    ],
                  ),
                ),
                productData.when(
                    data: (products) => Row(
                          children: [
                            for (var product in products)
                              ProductCard(product: product),
                          ],
                        ),
                    loading: () => const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.background,
                        )),
                    error: (err, stack) => const ErrorScreen())
                    // productData.when(
                //   data: (products) => Padding(
                //     padding: const EdgeInsets.all(16),
                //     child: Wrap(
                //       spacing: 16, // Horizontal space between items
                //       runSpacing: 16, // Vertical space between rows
                //       children: [
                //         for (var product in products)
                //           ProductCard(product: product),
                //       ],
                //     ),
                //   ),
                //   loading: () => const Center(
                //     child: CircularProgressIndicator(
                //       color: AppColors.background,
                //     ),
                //   ),
                //   error: (err, stack) => const ErrorScreen(),
                // )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
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
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.skyblue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
