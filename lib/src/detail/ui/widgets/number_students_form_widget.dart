import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/utils/translations.dart';
import 'package:universities/core/utils/validators.dart';
import 'package:universities/core/widgets/app_text.dart';
import 'package:universities/src/detail/viewmodel/university_detail_viewmodel.dart';

class NumberStudentsFormWidget
    extends HookViewModelWidget<UniversityDetailViewmodel> {
  NumberStudentsFormWidget({
    Key? key,
    required this.universityName,
  }) : super(key: key);

  final String universityName;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget buildViewModelWidget(
          BuildContext context, UniversityDetailViewmodel viewModel) =>
      ValueListenableBuilder(
        valueListenable: viewModel.autovalidateMode,
        builder: (context, autoValidate, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    lang.addNumberOfStudentsText,
                    fontSize: 16,
                    fontWeigth: AppFontWeigth.semibold,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: viewModel.numberOfStudentsController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 18,
                  ),
                  validator: Validators.requiredFieldValidator,
                  decoration: const InputDecoration(
                    fillColor: AppColors.itemBackground,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => viewModel.setNumberOfStudents(
                    universityName,
                    _formKey,
                  ),
                  child: AppText(
                    lang.submitButtonText,
                    fontSize: 18,
                    fontWeigth: AppFontWeigth.semibold,
                    color: AppColors.secondary,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
