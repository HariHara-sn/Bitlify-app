import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'colors.dart';

class AppStyles {
  static const TextStyle customStyle = TextStyle(color: AppColors.white, fontSize: 27);

  static NeumorphicStyle neuStyle = NeumorphicStyle(
    border: const NeumorphicBorder(color: AppColors.backgroundBlur),
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(13)),
    depth: 8,
    lightSource: LightSource.topLeft,
    color: AppColors.neocolor,
    shadowLightColor: Colors.black.withOpacity(0.5),
    shadowDarkColor: Colors.black.withOpacity(0.5),
  );
}
