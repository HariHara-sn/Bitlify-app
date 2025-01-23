import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:bike_shoping_app/core/constants/styles.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class CustomNeobutton extends StatelessWidget {
  final String img;
  const CustomNeobutton({required this.img, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      child: NeumorphicButton(
          onPressed: () {},
          style: AppStyles.neuStyle,
          child: Image.asset(
            width: 30,
            height: 35,
            img,
            color: AppColors.white.withOpacity(1),
          )),
    );
  }
}
