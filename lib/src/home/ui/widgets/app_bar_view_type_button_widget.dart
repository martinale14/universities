import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/utils/enums.dart';
import 'package:universities/src/home/viewmodel/home_viewmodel.dart';

class AppBarViewTypeButtonWidget extends HookViewModelWidget<HomeViewModel> {
  const AppBarViewTypeButtonWidget(
    this.icon,
    this.viewType, {
    super.key,
  });

  final IconData icon;
  final ViewType viewType;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) =>
      IconButton(
        onPressed: () => viewModel.setViewType(viewType),
        icon: Icon(
          icon,
          color: AppColors.secondary,
        ),
      );
}
