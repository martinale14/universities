import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:universities/core/api/either/api_result.dart';
import 'package:universities/core/api/exception/api_exception.dart';

abstract class AppBaseRepository<T> {
  late final T datasource;

  @mustCallSuper
  AppBaseRepository.from(this.datasource);
}

extension ResponseToapiResult<BodyType> on Response<BodyType> {
  ApiResult<BodyType> toApiResult() {
    if (error is ApiException) {
      return ApiResult.error(apiException: error as ApiException);
    }
    return ApiResult.complete(data: this.body);
  }
}
