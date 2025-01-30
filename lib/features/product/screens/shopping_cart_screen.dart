import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:bike_shoping_app/core/constants/copies.dart';
import 'package:bike_shoping_app/core/utils/widgets/custom_searchbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bike_shoping_app/features/product/controllers/product_controller.dart';
import 'package:bike_shoping_app/features/product/models/product_model.dart';

class ShoppingCartScreen extends ConsumerStatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  ConsumerState<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends ConsumerState<ShoppingCartScreen> {
  final Map<int, int> _quantities = {}; // To store product quantities

  @override
  Widget build(BuildContext context) {
    final productAsyncValue = ref.watch(productProvider);

    return Scaffold(
        backgroundColor: AppColors.backgroundBlur,
        appBar: AppBar(
          leading: const CustomSearchButton(
            passvalue: false,
          ),
          backgroundColor: AppColors.backgroundBlur,
          title: const Text(
            Copies.shoppingcart,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Existing Product List
            productAsyncValue.when(
              data: (products) => products.isEmpty
                  ? const Center(
                      child: Text("No Products Available",
                          style: TextStyle(color: Colors.white)))
                  : Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          _quantities.putIfAbsent(product.productid, () => 1);

                          return Column(
                            children: [
                              Card(
                                color: AppColors.backgroundBlur,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Product Image
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFF363E51),
                                                Color(0xFF4C5770)
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            product.image,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      // Product Details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "\$ ${product.price}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Quantity Buttons
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.add,
                                                color: Colors.blue),
                                            onPressed: () {
                                              setState(() {
                                                _quantities[product.productid] =
                                                    (_quantities[product
                                                                .productid] ??
                                                            1) +
                                                        1;
                                              });
                                            },
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.white12,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              _quantities[product.productid]
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.remove,
                                                color: Colors.grey),
                                            onPressed: () {
                                              setState(() {
                                                if (_quantities[
                                                        product.productid]! >
                                                    1) {
                                                  _quantities[
                                                          product.productid] =
                                                      (_quantities[product
                                                                  .productid] ??
                                                              1) -
                                                          1;
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(color: AppColors.white.withOpacity(0.2)),
                            ],
                          );
                        },
                      ),
                    ),
              loading: () => const Center(
                  child: CircularProgressIndicator(
                color: AppColors.neobottomsheetbtn,
              )),
              error: (err, stack) => Center(
                  child: Text("Error: $err",
                      style: const TextStyle(color: Colors.white))),
            ),

            // Cart Summary Section (BELOW Divider)
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.backgroundBlur,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Free Shipping Message
                  Text(
                    "Your bag qualifies for free shipping",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 8),

                  // Price Breakdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal:",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("\$6,119.99",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Fee:",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("\$0",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount:",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("30%",
                          style: TextStyle(color: Colors.green, fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 8),

                  // Total Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "\$4,283.99",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ));
  }
}
