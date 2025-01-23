import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
          );
  }
}