import 'package:get/get.dart';

import '../constants/constants.dart';

class EyeExaminationsController extends GetxController {
  Rx<EyeExaminationsType> eyeExaminations = EyeExaminationsType.date.obs;

  changeEyeExaminationsType(EyeExaminationsType type) {
    eyeExaminations.value = type;
  }
}
