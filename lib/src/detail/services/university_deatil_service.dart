import 'package:injectable/injectable.dart';
import 'package:universities/core/base/app_base_reactive_service.dart';
import 'package:universities/models/university_model.dart';

@lazySingleton
class UniversityDetailService extends AppBaseReactiveService {
  UniversityModel? university;

  @factoryMethod
  UniversityDetailService();
}
