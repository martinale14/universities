import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:universities/core/api/either/api_result.dart';
import 'package:universities/core/api/exception/api_exception.dart';
import 'package:universities/core/base/app_base_reactive_service.dart';
import 'package:universities/models/university_model.dart';
import 'package:universities/src/splash/api/repository/university_repository.dart';

@lazySingleton
class UniversityService extends AppBaseReactiveService {
  final UniversityRepository _universityRepository;
  final ReactiveValue<List<UniversityModel>?> universitiesReactiveValue =
      ReactiveValue(null);

  @factoryMethod
  UniversityService.from(this._universityRepository) {
    listenToReactiveValues([]);
  }

  Future<dynamic> getUniversities() {
    loadingReactiveValue.value = true;
    return _universityRepository.getUniversities().then((response) async {
      if (response.status == Status.completed) {
        universitiesReactiveValue.value =
            response.data as List<UniversityModel>;

        return response.data;
      } else {
        throw response.apiException as ApiException;
      }
    }).catchError((error) {
      throw error;
    }).whenComplete(() => loadingReactiveValue.value = false);
  }
}
