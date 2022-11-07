import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:universities/core/extensions/university_extension.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/utils/translations.dart';
import 'package:universities/core/widgets/app_bar.dart';
import 'package:universities/core/widgets/app_base_screen.dart';
import 'package:universities/core/widgets/app_text.dart';
import 'package:universities/core/widgets/loading.dart';
import 'package:universities/src/detail/ui/widgets/default_list_widget.dart';
import 'package:universities/src/detail/viewmodel/university_detail_viewmodel.dart';
import 'package:universities/src/detail/ui/widgets/number_students_form_widget.dart';

class UniversityDetailScreen extends StatelessWidget {
  const UniversityDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UniversityDetailViewmodel>.reactive(
      viewModelBuilder: () => UniversityDetailViewmodel(),
      builder: (context, viewModel, child) => viewModel.university == null
          ? const Loading()
          : AppBaseScreen(
              appBar: appBar(
                lang.detail(viewModel.university!.name),
              ),
              resizeToAvoidBottomInset: true,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 12,
                  ),
                  child: ListView(
                    children: [
                      AppText(
                        viewModel.university!.name,
                        fontSize: 24,
                        fontWeigth: AppFontWeigth.bold,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      ...UniversityExtension
                                  .images[viewModel.university!.name] !=
                              null
                          ? []
                          : [
                              AppText(
                                '(${lang.pressTheIconText})',
                                fontSize: 16,
                                maxLines: 2,
                                fontWeigth: AppFontWeigth.regular,
                                textAlign: TextAlign.center,
                                color: AppColors.secondary,
                              ),
                            ],
                      const SizedBox(height: 24),
                      ...UniversityExtension
                                  .images[viewModel.university!.name] !=
                              null
                          ? [
                              Center(
                                child: Image.file(
                                  File(
                                    UniversityExtension
                                        .images[viewModel.university!.name]!
                                        .path,
                                  ),
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                            ]
                          : [
                              GestureDetector(
                                onTap: () => viewModel.setImage(
                                  ImageSource.gallery,
                                  viewModel.university!.name,
                                ),
                                child: const Icon(
                                  Icons.school,
                                  color: AppColors.primary,
                                  size: 150,
                                ),
                              )
                            ],
                      const SizedBox(height: 18),
                      AppText(
                        '${viewModel.university!.country} (${viewModel.university!.alphaTwoCode})',
                        fontSize: 18,
                        fontWeigth: AppFontWeigth.semibold,
                        maxLines: 2,
                        color: AppColors.secondary,
                        textAlign: TextAlign.center,
                      ),
                      if (viewModel.university!.stateProvince != null) ...[
                        const SizedBox(height: 18),
                        AppText(
                          '${viewModel.university!.stateProvince} ',
                          fontSize: 14,
                          fontWeigth: AppFontWeigth.semibold,
                          maxLines: 2,
                          color: AppColors.secondary,
                          textAlign: TextAlign.center,
                        ),
                      ],
                      const SizedBox(height: 24),
                      DefaultListWidget(
                        title: lang.domainsTitle,
                        items: viewModel.university!.domains,
                      ),
                      const SizedBox(height: 24),
                      DefaultListWidget(
                        title: lang.webPagesTitle,
                        items: viewModel.university!.webPages,
                        onTap: viewModel.goTo,
                      ),
                      const SizedBox(height: 24),
                      if (UniversityExtension
                              .numberOfStudents[viewModel.university!.name] !=
                          null)
                        AppText(
                          '${lang.numerOfStudentsText}: ${UniversityExtension.numberOfStudents[viewModel.university!.name]}',
                          fontSize: 16,
                        ),
                      const SizedBox(height: 24),
                      NumberStudentsFormWidget(
                        universityName: viewModel.university!.name,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
