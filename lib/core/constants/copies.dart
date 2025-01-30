import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Copies {
  static const Text appbarnamewidget = Text(
    'Choose Your Bike',
    style: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
  static const String appbarname = 'Choose Your Bike';
  // static const Text appbar =  Text(
  //         Copies.appbarname,
  //         style: TextStyle(
  //           fontFamily: 'Poppins',
  //           fontWeight: FontWeight.bold,
  //           fontSize: 20,
  //         ),
  static Text offer = Text(
    '30% Off',
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.white.withOpacity(0.8),
    ),
  );

  static const String home = "Home";
  static const String categories = "Categories";
  static const String wishlist = "Wishlist";
  static const String profile = "Profile";
  static const String addtocart = 'Add to Cart';
  static const String sheettext =
      "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.";
  static const String desc = "Description";
  static const String specification = 'Specification';
  static const String shoppingcart = 'My Shopping Cart';
}
