import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:universities/core/extensions/university_extension.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/widgets/app_text.dart';
import 'package:universities/models/university_model.dart';
import 'package:universities/src/home/viewmodel/home_viewmodel.dart';

class UniversityGridItemWidget extends HookViewModelWidget<HomeViewModel> {
  const UniversityGridItemWidget({
    Key? key,
    required this.university,
  }) : super(key: key);

  final UniversityModel university;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) =>
      Container(
        margin: const EdgeInsets.all(5),
        child: Material(
          color: AppColors.itemBackground,
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            onTap: () => viewModel.goTodetail(university),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...UniversityExtension.images[university.name] != null
                      ? [
                          Center(
                            child: Image.file(
                              File(
                                UniversityExtension
                                    .images[university.name]!.path,
                              ),
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ]
                      : [
                          const Icon(
                            Icons.school,
                            color: AppColors.primary,
                            size: 50,
                          ),
                        ],
                  const SizedBox(height: 10),
                  AppText(
                    university.name,
                    fontWeigth: AppFontWeigth.semibold,
                  ),
                  const SizedBox(height: 10),
                  AppText(
                    university.country,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
