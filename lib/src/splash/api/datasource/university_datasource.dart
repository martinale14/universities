import 'package:chopper/chopper.dart';
import 'package:universities/models/university_model.dart';

part 'university_datasource.chopper.dart';

@ChopperApi()
abstract class UniversityDataSource extends ChopperService {
  @Get(path: 'FE-Engineer-test/universities.json')
  Future<Response<List<UniversityModel>>> getUniversities();

  static _$UniversityDataSource create([ChopperClient? client]) =>
      _$UniversityDataSource(client);
}
