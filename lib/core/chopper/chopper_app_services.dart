import 'package:chopper/chopper.dart';
import 'package:universities/src/splash/api/datasource/university_datasource.dart';

List<ChopperService> get appChopperServices => [
      UniversityDataSource.create(),
    ];
