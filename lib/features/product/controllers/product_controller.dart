import '../models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bike_shoping_app/core/constants/images.dart';

final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));

  const json = {
    "products": [
      {
        "productid": 1,
        "name": "Road BIke",
        "description": "PEUGEOT - LR01",
        "price": "1,999.99",
        "image": AppImages.vectorcycle
      },
      {
        "productid": 2,
        "name": "Road Helmet",
        "description": "SMITH - Trade",
        "price": "120",
        "image": AppImages.vectorHelmet
      },
      {
        "productid": 4,
        "name": "Off Road bike",
        "description": "PILOT - CHROMOLY",
        "price": "3,999.99",
        "image": AppImages.pivotBike,
      },
      {
        "productid": 3,
        "name": "E-Bike",
        "description": "Hari-Trade",
        "price": "5,999.99",
        "image": AppImages.bikeImage,
      },
      {
        "productid": 4,
        "name": "E-Bike",
        "description": "Google-Wrap",
        "price": "8,999.99",
        "image": AppImages.bikeImage,
      }
    ]
  };

  return (json['products'] as List<dynamic>)
      .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList();
});
    



    
    // ProductModel(
    //   productid: 1,
    //   name: 'Road BIke',
    //   description: 'PEUGEOT - LR01',
    //   price: '1,999.99',
    //   image: AppImages.vectorcycle,
    // ),
    // ProductModel(
    //   productid: 2,
    //   name: 'Road Helmet',
    //   description: 'SMITH - Trade',
    //   price: '120',
    //   image: AppImages.vectorHelmet,
    // ),
    // ProductModel(
    //   productid: 4,
    //   name: 'Off Road bike',
    //   description: 'PILOT - CHROMOLY',
    //   price: '3,999.99',
    //   image: AppImages.pivotBike,
    // ),
    // ProductModel(
    //   productid: 3,
    //   name: 'E-Bike',
    //   description: 'Hari-Trade',
    //   price: '5,999.99',
    //   image: AppImages.bikeImage,
    // ),
//   ];
// });
