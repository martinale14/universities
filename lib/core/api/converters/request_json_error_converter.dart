import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:universities/core/api/exception/api_exception.dart';

class RequestJsonErrorConverter implements ErrorConverter {
  @override
  FutureOr<Response> convertError<BodyType, InnerType>(Response response) {
    ApiException apiException = ApiException.error(response);
    return response.copyWith(bodyError: apiException);
  }
}
