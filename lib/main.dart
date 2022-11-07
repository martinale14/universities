import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universities/app.dart';
import 'package:universities/core/app_component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureLocator();

  await init();

  bottomSheetService.setCustomSheetBuilders(bottomSheetBuilders);
  dialogService.registerCustomDialogBuilders(dialogBuilders);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );

  coreNavigator.config(defaultTransitionStyle: Transition.fade);

  String systemLocaleCode =
      (await Devicelocale.currentLocale) == 'en' ? 'en' : 'es';

  runApp(
    App(
      systemLocale: Locale(systemLocaleCode),
    ),
  );
}
