import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

assetSVG(String nameFile,
        {BoxFit fit = BoxFit.contain, bool isIcon = false, Color? color}) =>
    SvgPicture.asset(
      'assets/svg/${isIcon ? 'icons/' : ''}$nameFile.svg',
      fit: fit,
      color: color,
    );

assetPNG(
  String nameFile, {
  double? width,
  BoxFit? fit,
}) =>
    Image.asset(
      'assets/images/$nameFile.png',
      width: width,
      fit: fit,
    );

extension AppImages on Widget {}
