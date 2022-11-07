import 'package:universities/core/api/exception/api_exception.dart';

class ApiResult<T> {
  Status status;
  T? data;
  ApiException? apiException;

  ApiResult.complete({this.data}) : status = Status.completed;
  ApiResult.error({this.apiException}) : status = Status.error;
}

enum Status { completed, error }
