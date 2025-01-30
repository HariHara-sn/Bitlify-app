import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class BottomsheetNeomorphish extends StatelessWidget {
  final String text;
  final double depvalue;
  final Color colorvalue;
  const BottomsheetNeomorphish(
      {required this.text,
      required this.depvalue,
      required this.colorvalue,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        style: NeumorphicStyle(
          color: const Color(0XFF333C50),
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          depth: depvalue,
          intensity: 0.8,
          lightSource: LightSource.topLeft,
          shadowDarkColor: AppColors.backgroundBlur,
          shadowLightColor: AppColors.backgroundBlur,
          
        ),
        margin: const EdgeInsets.all(10),
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorvalue,
          ),
        ));
  }
}
