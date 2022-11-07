import 'dart:async';

import 'package:universities/core/api/exception/api_exception.dart';
import 'package:universities/core/app_component.dart';
import 'package:universities/core/utils/custom_dialog.dart';
import 'package:stacked/stacked.dart';

abstract class AppBaseViewModel extends ReactiveViewModel {
  FutureOr<dynamic> handleApiError(Object exception,
      {Function? click, Function? socialRegister}) {
    if (exception is ApiException) {
      if (exception is UnAuthorizedAccessException) {
        sharedPreferencesHelper.clearData();
      } else if (exception is ApiErrorUnProcessableEntity) {
        showAlertDialog(exception.message!, okClick: click);
      } else if (exception is ApiErrorSeveralSessions) {
        showAlertDialog(exception.message!, okClick: click);
      } else if (exception is ApiErrorSession) {
        showAlertDialog(exception.message!, okClick: click);
      } else if (exception is ApiErrorResponse) {
        showAlertDialog(exception.message!, okClick: click);
      }
    } else {
      showAlertDialog(exception.toString(), okClick: click);
    }
    throw exception;
  }
}
