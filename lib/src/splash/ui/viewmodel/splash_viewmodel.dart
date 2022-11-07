import 'package:stacked/stacked.dart';
import 'package:universities/core/app_component.dart';
import 'package:universities/core/base/app_base_view_model.dart';
import 'package:universities/src/splash/services/university_service.dart';

class SplashViewModel extends AppBaseViewModel {
  final UniversityService _universityService = locator<UniversityService>();

  bool get loading => _universityService.loadingReactiveValue.value;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_universityService];

  SplashViewModel() {
    getUniversities();
  }

  getUniversities() {
    _universityService.getUniversities().then((value) {}).catchError((error) {
      handleApiError(error);
    });
  }
}
