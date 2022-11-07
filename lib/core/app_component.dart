import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:universities/core/app_component.config.dart';
import 'package:universities/core/utils/app_navigator.dart';
import 'package:universities/core/utils/shared_preferences_helper.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

@InjectableInit(preferRelativeImports: false, initializerName: r'$appInitGetIt')
void configureLocator() => $appInitGetIt(locator);

final bottomSheetService = locator<BottomSheetService>();
final coreNavigator = locator<CoreNavigator>();
final dialogService = locator<DialogService>();
final snackBarService = locator<SnackbarService>();
final sharedPreferencesHelper = locator<SharedPreferencesHelper>();

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

final Map<
    dynamic,
    Widget Function(BuildContext, SheetRequest<dynamic>,
        void Function(SheetResponse<dynamic>))> bottomSheetBuilders = {};

final Map<
    dynamic,
    Widget Function(BuildContext, DialogRequest<dynamic>,
        void Function(DialogResponse<dynamic>))> dialogBuilders = {};
