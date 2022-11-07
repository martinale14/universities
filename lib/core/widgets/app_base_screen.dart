import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:universities/core/utils/app_colors.dart';
import 'package:universities/core/widgets/disable_glow_scroll.dart';
import 'package:universities/core/widgets/loading.dart';

class AppBaseScreen extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigation;
  final bool isLoading;
  final WillPopCallback? onBackPressed;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final Color? backgroundColor;
  final Widget? fab;
  final Color? statusBarColor;
  final Brightness? statusBarTheme;
  final Color? systemNavigationBarColor;
  final bool topSafeArea;
  final Widget? loadingWidget;

  const AppBaseScreen(
      {Key? key,
      required this.body,
      this.appBar,
      this.drawer,
      this.bottomNavigation,
      this.onBackPressed,
      this.isLoading = false,
      this.resizeToAvoidBottomInset = false,
      this.extendBody = false,
      this.backgroundColor,
      this.fab,
      this.statusBarColor,
      this.statusBarTheme,
      this.systemNavigationBarColor,
      this.topSafeArea = true,
      this.loadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) => KeyboardDismissOnTap(
        child: Container(
          color: backgroundColor ?? Colors.white,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                statusBarColor: statusBarColor ?? Colors.white,
                systemNavigationBarColor:
                    systemNavigationBarColor ?? Colors.white,
                statusBarBrightness: statusBarTheme ?? Brightness.dark,
                statusBarIconBrightness: statusBarTheme ?? Brightness.dark,
                systemNavigationBarIconBrightness:
                    statusBarTheme ?? Brightness.dark),
            child: WillPopScope(
              onWillPop: onBackPressed ?? () async => true,
              child: Stack(
                children: [
                  SafeArea(
                    top: topSafeArea,
                    child: Scaffold(
                      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                      extendBody: extendBody,
                      backgroundColor: backgroundColor ?? AppColors.background,
                      appBar: appBar,
                      drawer: drawer,
                      floatingActionButton: fab,
                      body: disableGlow(body),
                      bottomNavigationBar: bottomNavigation,
                    ),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: loadingWidget ?? const Loading(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
