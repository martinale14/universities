import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:universities/core/chopper/chopper_app_converters.dart';
import 'package:universities/core/chopper/chopper_app_services.dart';
import 'package:universities/core/utils/enviroment_urls.dart';

abstract class ConfigChopperClient {
  String get baseUrl;
  String get api3BaseUrl;
  Iterable<ChopperService> get services;
  Map<Type, Function> get typeToJsonFactoryMap;
}

@Injectable(as: ConfigChopperClient)
class UniversitiesChopperConfiguration extends ConfigChopperClient {
  @override
  String get api3BaseUrl => enviromentUrls['dev']!;

  @override
  String get baseUrl => enviromentUrls['dev']!;

  @override
  Iterable<ChopperService> get services => appChopperServices;

  @override
  Map<Type, Function> get typeToJsonFactoryMap => appJsonConverters;
}
