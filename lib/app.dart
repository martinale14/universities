import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universities/core/utils/app_navigator.dart';
import 'package:universities/core/utils/theme_data.dart';
import 'package:universities/generated/l10n.dart';

class App extends StatefulWidget {
  const App({super.key, required this.systemLocale});

  final Locale systemLocale;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      locale: widget.systemLocale,
      theme: theme,
      initialRoute: Pages.splash,
      navigatorKey: StackedService.navigatorKey,
      routes: routesApp,
    );
  }
}
