import 'package:universities/models/university_model.dart';

Map<Type, Function> get appJsonConverters => {
      UniversityModel: (jsonData) => UniversityModel.fromJson(jsonData),
    };
