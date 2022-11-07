import 'package:image_picker/image_picker.dart';
import 'package:universities/models/university_model.dart';

extension UniversityExtension on UniversityModel {
  static Map<String, XFile> images = {};
  static Map<String, int> numberOfStudents = {};
}
