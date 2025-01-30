import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:bike_shoping_app/core/constants/images.dart';
import 'package:flutter/material.dart';

class CustomSearchButton extends StatelessWidget {
  final bool passvalue;
  const CustomSearchButton({super.key, this.passvalue = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Container(
          padding: passvalue
              ? const EdgeInsets.all(10)
              : const EdgeInsets.only(left: 5),
          margin: passvalue
              ? const EdgeInsets.all(1)
              : const EdgeInsets.only(top: 20, bottom: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.searchcolor1, AppColors.searchcolor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: passvalue
              ? Image.asset(
                  AppImages.searchimg,
                  width: 20,
                  height: 20,
                )
              : Center(
                  child: iconbtn(),
                )),
    );
  }
}

Widget iconbtn() {
  return IconButton(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      disabledColor: Colors.transparent,
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.white,
      ));
}
