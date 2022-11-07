import 'package:universities/core/app_component.dart';
import 'package:universities/core/utils/enums.dart';
import 'package:universities/core/utils/translations.dart';

showAlertDialog(
  String message, {
  String? title,
  String? okButton,
  String? cancelButton,
  Function? okClick,
  Function? cancelClick,
  bool oneButton = true,
  bool cancelable = true,
}) async {
  final sheetResponse = await dialogService.showCustomDialog(
    variant: DialogType.floating,
    title: title,
    description: message,
    mainButtonTitle: okButton ?? lang.acceptButtonText,
    secondaryButtonTitle: cancelButton ?? lang.cancelButttonText,
    showIconInSecondaryButton: !oneButton,
    barrierDismissible: cancelable,
  );
  if (sheetResponse?.confirmed == true) {
    okClick?.call();
  } else {
    cancelClick?.call();
  }
}
