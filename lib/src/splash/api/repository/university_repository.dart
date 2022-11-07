import 'package:injectable/injectable.dart';
import 'package:universities/core/api/either/api_result.dart';
import 'package:universities/core/base/app_base_repository.dart';
import 'package:universities/src/splash/api/datasource/university_datasource.dart';

@Injectable()
class UniversityRepository extends AppBaseRepository<UniversityDataSource> {
  @factoryMethod
  UniversityRepository.from(super.datasource) : super.from();

  Future<ApiResult<dynamic>> getUniversities() =>
      datasource.getUniversities().then(
            (value) => value.toApiResult(),
          );
}
