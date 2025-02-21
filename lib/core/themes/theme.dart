import 'package:bike_shoping_app/core/constants/styles.dart';
import '/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: AppColors.background,
  textTheme:  TextTheme(),
  appBarTheme:  AppBarTheme(
    
    surfaceTintColor: AppColors.blue,
    backgroundColor: AppColors.blue,
    titleTextStyle: AppStyles.customStyle,
    toolbarHeight: 100,
  ),
);
