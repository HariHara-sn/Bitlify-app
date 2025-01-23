import '../models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bike_shoping_app/core/constants/images.dart';

// Provider for fetching product data
final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return [
    ProductModel(
      productid: 1,
      name: 'Road Helmet',
      description: 'SMITH - Trade',
      price: 120,
      image: AppImages.helmetImage,
    ),
    ProductModel(
      productid: 1,
      name: 'Air Helmet',
      description: 'Hari - Trade',
      price: 120,
      image: AppImages.helmetImage,
    ),
  ];
});
