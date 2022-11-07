import 'dart:convert';

import 'package:universities/core/utils/app_constants.dart';
import 'package:universities/core/utils/enums.dart';

extension StringExtension on String {
  bool isJson() {
    try {
      json.encode(this);
    } catch (e) {
      return false;
    }
    return true;
  }

  Map<String, dynamic> toJson() {
    return json.decode(trim());
  }

  ViewType toViewType() {
    switch (this) {
      case Constants.gridViewType:
        return ViewType.grid;

      case Constants.listViewType:
        return ViewType.list;

      default:
        return ViewType.grid;
    }
  }
}
