import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:universities/core/api/converters/request_json_converter.dart';
import 'package:universities/core/api/converters/request_json_error_converter.dart';
import 'package:universities/core/api/interceptors/chopper_logging_interceptor.dart';
import 'package:universities/core/chopper/config_chopper_client.dart';

@module
@injectable
abstract class ChopperModule {
  @lazySingleton
  ChopperClient chopper(ConfigChopperClient configChopperClient) {
    return ChopperClient(
      interceptors: [
        const HeadersInterceptor(
          {
            'Accept': 'application/json; charset=utf-8',
            'Content-Type': 'application/json',
          },
        ),
        if (!kReleaseMode) ChopperLoggingInterceptor(),
      ],
      baseUrl: configChopperClient.baseUrl,
      services: configChopperClient.services,
      converter: RequestJsonConverter(configChopperClient.typeToJsonFactoryMap),
      errorConverter: RequestJsonErrorConverter(),
    );
  }
}
