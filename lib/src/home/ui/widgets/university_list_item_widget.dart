import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/widgets/app_text.dart';
import 'package:universities/models/university_model.dart';
import 'package:universities/src/home/viewmodel/home_viewmodel.dart';

class UniversityListItemWidget extends HookViewModelWidget<HomeViewModel> {
  const UniversityListItemWidget({
    Key? key,
    required this.university,
  }) : super(key: key);

  final UniversityModel university;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) =>
      ListTile(
        leading: const Icon(
          Icons.school,
          color: AppColors.primary,
          size: 50,
        ),
        onTap: () {},
        title: AppText(
          university.name,
          fontWeigth: AppFontWeigth.semibold,
        ),
        subtitle: AppText(
          university.country,
          color: AppColors.secondary,
        ),
      );
}
