import 'package:chopper/chopper.dart';
import 'package:universities/core/extensions/string_extension.dart';
import 'package:universities/core/utils/translations.dart';

class ApiException<T> {
  static ApiException<dynamic> error(Response<dynamic> response) {
    ApiException apiResponse = ApiErrorResponse(lang.serverErrorText);
    if (!response.isSuccessful) {
      String message;
      if (response.error != null) {
        message = response.error.toString();
      } else {
        message = response.body.toString();
      }
      if (message.isNotEmpty) {
        if (message.isJson()) {
          try {
            var json = message.toJson();
            switch (response.statusCode) {
              case 422:
                if (json.containsKey('multiple_session_message')) {
                  apiResponse = ApiErrorSeveralSessions(
                      json['multiple_session_message'].toString());
                } else if (json.containsKey('provider')) {
                  apiResponse = ApiErrorSocialUncreated(
                      json['provider'] == 'facebook'
                          ? lang.serverErrorText
                          : lang.serverErrorText,
                      json['provider'].toString());
                } else if (json
                    .containsValue(lang.unauthorizedExceptionMessage)) {
                  apiResponse =
                      UnAuthorizedAccessException(json['mssg'].toString());
                } else {
                  apiResponse =
                      ApiErrorUnProcessableEntity(json['mssg'].toString());
                }
                break;
              case 401:
                apiResponse =
                    UnAuthorizedAccessException(json['mssg'].toString());
                break;
              case 403:
                apiResponse = ApiErrorSession(json['mssg'].toString());
                break;
              default:
                apiResponse = ApiErrorResponse(lang.serverErrorText);
                break;
            }
          } catch (e) {
            apiResponse = ApiErrorResponse(lang.internetErrorText);
          }
        }
      }
    }
    return apiResponse;
  }
}

class ApiErrorResponse<T> extends ApiException<T> {
  final String? message;

  ApiErrorResponse([this.message]);
}

class ApiErrorUnProcessableEntity<T> extends ApiException<T> {
  final String? message;

  ApiErrorUnProcessableEntity([this.message]);
}

class ApiErrorSocialUncreated<T> extends ApiException<T> {
  final String? message;
  final String? provider;

  ApiErrorSocialUncreated([this.message, this.provider]);
}

class UnAuthorizedAccessException<T> extends ApiException<T> {
  final String? message;

  UnAuthorizedAccessException([this.message]);
}

class ApiErrorSeveralSessions<T> extends ApiException<T> {
  final String? message;

  ApiErrorSeveralSessions([this.message]);
}

class ApiErrorSession<T> extends ApiException<T> {
  final String? message;

  ApiErrorSession([this.message]);
}
