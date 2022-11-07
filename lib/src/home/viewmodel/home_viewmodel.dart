import 'package:stacked/stacked.dart';
import 'package:universities/core/app_component.dart';
import 'package:universities/core/base/app_base_view_model.dart';
import 'package:universities/core/utils/app_navigator.dart';
import 'package:universities/core/utils/enums.dart';
import 'package:universities/models/university_model.dart';
import 'package:universities/src/detail/services/university_deatil_service.dart';
import 'package:universities/src/home/services/home_service.dart';
import 'package:universities/src/home/ui/widgets/universities_grid_view_widget.dart';
import 'package:universities/src/home/ui/widgets/universities_list_view_widget.dart';
import 'package:universities/src/splash/services/university_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends AppBaseViewModel {
  final UniversityService _universityService = locator<UniversityService>();
  final HomeService _homeService = locator<HomeService>();
  final UniversityDetailService _universityDetailService =
      locator<UniversityDetailService>();

  ScrollController _controller = ScrollController();

  bool get loading =>
      _universityService.loadingReactiveValue.value ||
      _homeService.loadingReactiveValue.value ||
      _universityDetailService.loadingReactiveValue.value;

  ViewType get viewType => _homeService.viewTypeReactiveValue.value;

  List<UniversityModel>? get universities =>
      _universityService.universitiesReactiveValue.value;

  List<UniversityModel> currentUniversities = [];

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _universityService,
        _homeService,
        _universityDetailService,
      ];

  HomeViewModel();

  Widget defineChild(List<UniversityModel> newUniversities) {
    switch (viewType) {
      case ViewType.grid:
        return UniversitiesGridViewWidget(
          universities: newUniversities,
        );
      case ViewType.list:
        return UniversitiesListViewWidget(
          universities: newUniversities,
        );
    }
  }

  setController(ScrollController controller) {
    _controller = controller;
  }

  setCurrentUniversities(List<UniversityModel> newUniversities) {
    currentUniversities = newUniversities;
    notifyListeners();
  }

  setViewType(ViewType viewType) {
    _homeService.saveViewType(viewType);
    _controller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  goTodetail(UniversityModel university) async {
    _universityDetailService.university = university;
    await coreNavigator.push(Pages.universityDetail);
    notifyListeners();
  }
}
