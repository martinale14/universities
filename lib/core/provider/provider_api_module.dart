import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:universities/src/splash/api/datasource/university_datasource.dart';

@module
abstract class ProviderApiModule {
  UniversityDataSource universityDataSource(ChopperClient client) =>
      client.getService<UniversityDataSource>();
}
