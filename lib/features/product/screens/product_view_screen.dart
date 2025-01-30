import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:bike_shoping_app/core/constants/copies.dart';
import 'package:bike_shoping_app/features/product/models/product_model.dart';
import 'package:bike_shoping_app/features/widgets/bottomsheet_neomorphish.dart';
import 'package:bike_shoping_app/routes/routes.dart';
import 'package:flutter/material.dart';

class ProductViewScreen extends StatefulWidget {
  final ProductModel product;

  const ProductViewScreen({super.key, required this.product});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sheetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _sheetAnimation = Tween<double>(begin: 0.3, end: 0.6).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final product = widget.product;
    void pageNavigation() => Navigator.pushNamed(context, Routes.shoppingpage);

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: DiagonalClipper(),
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 0.6, 1],
                  colors: [
                    Color(0xFF37B6E9),
                    Color(0xFF4B4CED),
                    Color(0xFF4B4CED),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                product.description,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.3),
                  child: Image.asset(
                    product.image,
                    width: width * 0.9,
                  ),
                ),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _sheetAnimation,
                    builder: (context, child) {
                      return DraggableScrollableSheet(
                        initialChildSize: _sheetAnimation.value,
                        minChildSize: 0.3,
                        maxChildSize: 1.0,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Color(0XFF333C50),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BottomsheetNeomorphish(
                                          text: Copies.desc,
                                          depvalue: 8,
                                          colorvalue:
                                              AppColors.neobottomsheetbtn),
                                      BottomsheetNeomorphish(
                                          text: Copies.specification,
                                          depvalue: -5,
                                          colorvalue: AppColors.grey),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    widget.product.description,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    Copies.sheettext,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$ ${widget.product.price}',
                                        style: const TextStyle(
                                          color: AppColors.neobottomsheetbtn,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: AppColors.white,
                                                width: 0.5),
                                          ),
                                          backgroundColor: AppColors.neobottomsheetbtn.withOpacity(0.3),
                                          padding: const EdgeInsets.symmetric( horizontal: 24, vertical: 12),),
                                        onPressed: () => pageNavigation(),
                                        child: const Text(
                                          Copies.addtocart,
                                          style:
                                              TextStyle(color: AppColors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    final path = Path();
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
