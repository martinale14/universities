import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universities/core/app_component.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/utils/app_constants.dart';
import 'package:universities/core/widgets/app_text.dart';

AppBar appBar(
  String? title, {
  Function()? onPressed,
  Widget? child,
  Color? backgroundColor = AppColors.itemBackground,
  bool noBack = false,
  Color? textColor = AppColors.secondary,
  AppFontWeigth fontWeight = AppFontWeigth.semibold,
  Widget? backIcon,
  double? fontSize = 20,
  bool centerTitle = false,
  List<Widget>? actions,
}) =>
    AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: child ??
          AppText(
            title ?? Constants.emptyString,
            fontSize: fontSize,
            color: textColor,
            fontWeigth: fontWeight,
          ),
      elevation: 1,
      leading: noBack
          ? null
          : IconButton(
              icon: backIcon ??
                  const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.secondary,
                  ),
              iconSize: 21,
              onPressed: () =>
                  onPressed != null ? onPressed.call() : coreNavigator.back(),
            ),
      actions: actions,
    );
