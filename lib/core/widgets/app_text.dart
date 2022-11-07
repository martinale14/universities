import 'package:flutter/material.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/utils/app_constants.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.content, {
    Key? key,
    this.fontWeigth = AppFontWeigth.regular,
    this.fontSize = 14,
    this.color = AppColors.primary,
    this.textAlign,
    this.maxLines,
    this.decoration = TextDecoration.none,
  }) : super(key: key);

  final String content;
  final AppFontWeigth fontWeigth;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? decoration;

  FontWeight get realFontWeigth {
    switch (fontWeigth) {
      case AppFontWeigth.regular:
        return FontWeight.w400;
      case AppFontWeigth.medium:
        return FontWeight.w500;
      case AppFontWeigth.semibold:
        return FontWeight.w600;
      case AppFontWeigth.bold:
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontFamily: Constants.defaultFont,
        fontWeight: realFontWeigth,
        fontSize: fontSize,
        color: color,
        decoration: decoration,
      ),
    );
  }
}

enum AppFontWeigth { regular, medium, semibold, bold }
