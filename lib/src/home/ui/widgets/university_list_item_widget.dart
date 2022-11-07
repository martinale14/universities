import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:universities/core/extensions/university_extension.dart';
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
        leading: UniversityExtension.images[university.name] != null
            ? SizedBox(
                width: 80,
                height: 80,
                child: Center(
                  child: Image.file(
                    File(
                      UniversityExtension.images[university.name]!.path,
                    ),
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              )
            : const Icon(
                Icons.school,
                color: AppColors.primary,
                size: 50,
              ),
        onTap: () => viewModel.goTodetail(university),
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
