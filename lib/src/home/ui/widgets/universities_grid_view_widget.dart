import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:universities/models/university_model.dart';
import 'package:universities/src/home/ui/widgets/university_grid_item_widget.dart';
import 'package:universities/src/home/viewmodel/home_viewmodel.dart';

class UniversitiesGridViewWidget extends HookViewModelWidget<HomeViewModel> {
  const UniversitiesGridViewWidget({
    super.key,
    required this.universities,
  });

  final List<UniversityModel> universities;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) =>
      SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (_, universityIndex) => UniversityGridItemWidget(
            university: universities[universityIndex],
          ),
          childCount: universities.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      );
}
