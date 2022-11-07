import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:universities/models/university_model.dart';
import 'package:universities/src/home/ui/widgets/university_list_item_widget.dart';
import 'package:universities/src/home/viewmodel/home_viewmodel.dart';

class UniversitiesListViewWidget extends HookViewModelWidget<HomeViewModel> {
  const UniversitiesListViewWidget({
    super.key,
    required this.universities,
  });

  final List<UniversityModel> universities;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) =>
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, universityIndex) {
            return UniversityListItemWidget(
              university: universities[universityIndex],
            );
          },
          childCount: universities.length,
        ),
      );
}
