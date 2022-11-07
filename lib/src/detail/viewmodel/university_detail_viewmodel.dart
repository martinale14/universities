import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:universities/core/app_component.dart';
import 'package:universities/core/base/app_base_view_model.dart';
import 'package:universities/core/extensions/university_extension.dart';
import 'package:universities/core/utils/app_constants.dart';
import 'package:universities/models/university_model.dart';
import 'package:universities/src/detail/services/university_deatil_service.dart';
import 'package:universities/src/splash/services/university_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UniversityDetailViewmodel extends AppBaseViewModel {
  final UniversityDetailService _universityDetailService =
      locator<UniversityDetailService>();
  final UniversityService _universityService = locator<UniversityService>();

  final ImagePicker picker = ImagePicker();

  final TextEditingController numberOfStudentsController =
      TextEditingController();

  ValueNotifier<AutovalidateMode> autovalidateMode =
      ValueNotifier(AutovalidateMode.disabled);

  bool get loading => _universityDetailService.loadingReactiveValue.value;

  UniversityModel? get university => _universityDetailService.university;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _universityDetailService,
        _universityService,
      ];

  Future setImage(ImageSource media, String universityName) async {
    XFile? img = await picker.pickImage(source: media);
    if (img != null) {
      UniversityExtension.images[universityName] = img;
      notifyListeners();
    }
  }

  Future setNumberOfStudents(
    String universityName,
    GlobalKey<FormState> formKey,
  ) async {
    if (formKey.currentState!.validate()) {
      UniversityExtension.numberOfStudents[universityName] =
          int.parse(numberOfStudentsController.text);
      numberOfStudentsController.text = Constants.emptyString;
      notifyListeners();
    }

    if (autovalidateMode.value != AutovalidateMode.always) {
      autovalidateMode.value = AutovalidateMode.always;
    }
  }

  UniversityDetailViewmodel();

  goTo(String url) async {
    launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
}
