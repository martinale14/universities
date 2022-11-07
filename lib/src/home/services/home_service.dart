import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:universities/core/app_component.dart';
import 'package:universities/core/base/app_base_reactive_service.dart';
import 'package:universities/core/extensions/string_extension.dart';
import 'package:universities/core/extensions/view_type_extension.dart';
import 'package:universities/core/utils/enums.dart';
import 'package:universities/core/utils/shared_preferences_helper.dart';

@lazySingleton
class HomeService extends AppBaseReactiveService {
  final ReactiveValue<ViewType> viewTypeReactiveValue =
      ReactiveValue(ViewType.grid);
  final _helper = locator<SharedPreferencesHelper>();

  @factoryMethod
  HomeService() {
    listenToReactiveValues([
      viewTypeReactiveValue,
    ]);
    getViewType();
  }

  getViewType() async {
    loadingReactiveValue.value = true;
    _helper.getViewType().then((value) {
      if (value != null) {
        viewTypeReactiveValue.value = value.toViewType();
      }
    }).whenComplete(() => loadingReactiveValue.value = false);
  }

  saveViewType(ViewType viewType) {
    viewTypeReactiveValue.value = viewType;
    _helper.setViewType(
      ViewTypeExtension.viewTypeToString(viewType),
    );
  }
}
