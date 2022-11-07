import 'package:flutter/material.dart';
import 'package:universities/core/utils/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, this.progress}) : super(key: key);

  final Widget? progress;

  @override
  Widget build(BuildContext context) => Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: AppColors.background,
        child: Center(
          child: progress ?? const CircularProgressIndicator(),
        ),
      );
}
