import 'package:universities/core/utils/app_constants.dart';
import 'package:universities/core/utils/enums.dart';

extension ViewTypeExtension on ViewType {
  static String viewTypeToString(ViewType viewType) {
    switch (viewType) {
      case ViewType.grid:
        return Constants.gridViewType;
      case ViewType.list:
        return Constants.listViewType;
    }
  }
}
