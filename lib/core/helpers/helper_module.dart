import 'package:injectable/injectable.dart';
import 'package:universities/core/utils/app_navigator.dart';
import 'package:universities/core/utils/shared_preferences_helper.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class HelperModule {
  @lazySingleton
  CoreNavigator get appNavigator;

  @lazySingleton
  BottomSheetService get bottomSheetservice;

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  SnackbarService get snackBarService;

  @lazySingleton
  SharedPreferencesHelper get sharedPreferencesHelper;
}
