import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class AppBaseReactiveService with ReactiveServiceMixin {
  final ReactiveValue<bool> loadingReactiveValue = ReactiveValue(false);

  bool get loading => loadingReactiveValue.value;

  set loading(bool value) => loadingReactiveValue.value = value;

  @mustCallSuper
  AppBaseReactiveService() {
    listenToReactiveValues([
      loadingReactiveValue,
    ]);
  }
}
