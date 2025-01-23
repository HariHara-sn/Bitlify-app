import 'dart:ui';
import 'package:bike_shoping_app/core/utils/widgets/custom_searchbtn.dart';
import 'package:bike_shoping_app/features/widgets/bottomNavigationBar.dart';
import 'package:bike_shoping_app/features/widgets/initial_container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bike_shoping_app/core/constants/images.dart';
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

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  int _selectedIndex = 0;

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
        actions: const [CustomSearchButton()],
        title: Copies.appbarname,
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.rectangle,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: const InitialContainer()),
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
                  data: (products) => Wrap(
                    children: [
                      for (var product in products)
                        ProductCard(product: product),
                    ],
                  ),
                  loading: () => Wrap(
                    children: List.generate(
                      4,
                      (index) => Shimmer.fromColors(
                        baseColor: Colors.blue[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          margin: const EdgeInsets.all(15.0),
                          width: 175,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              colors: [
                                Colors.blueGrey.shade400,
                                Colors.blue.shade900
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  error: (err, stack) => const ErrorScreen(),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Bottomnavigationbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
