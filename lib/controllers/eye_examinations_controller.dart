import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../data/di/locator.dart';
import '../data/models/response/response.dart';
import '../data/repository/repository.dart';

class EyeExaminationsController extends GetxController {
  RxList<EyeSightModel> eyeSightsList = <EyeSightModel>[].obs;
  final _eyeRepository = locator<EyeRepository>();
  RxBool isLoggedIn = false.obs;

  Rx<EyeExaminationsType> eyeExaminations = EyeExaminationsType.date.obs;

  changeEyeExaminationsType(EyeExaminationsType type) {
    eyeExaminations.value = type;
  }

  void getEyeSight() async {
    isLoggedIn.value = true;
    try {
      final result = await _eyeRepository.getEyeSight();
      if (result.data != null) {
        isLoggedIn.value = false;
        eyeSightsList.value = result.data!;
      } else {
        Get.showSnackbar(GetSnackBar(
          title: 'Error',
          message: result.error?.message,
        ));
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: e.message,
      ));
    } finally {
      isLoggedIn.value = false;
      //Dismiss Dialog .
      // Get.back();
    }
  }

  void storeEyeSight() async {
    isLoggedIn.value = true;
    try {
      var data = {
        'date': '',
        'notes': '',
      };
      final result = await _eyeRepository.storeEyeSight(data);
      if (result.data != null) {
        isLoggedIn.value = false;
        eyeSightsList.value = result.data!;
      } else {
        Get.showSnackbar(GetSnackBar(
          title: 'Error',
          message: result.error?.message,
        ));
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: e.message,
      ));
    } finally {
      isLoggedIn.value = false;
      //Dismiss Dialog .
      // Get.back();
    }
  }
}
