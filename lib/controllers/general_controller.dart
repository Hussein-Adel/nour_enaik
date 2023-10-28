import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/constants/constants.dart';
import 'package:nour_enaik/ui/screens/about_farco_screen.dart';

import '../data/di/locator.dart';
import '../data/models/response/response.dart';
import '../data/repository/repository.dart';

class GeneralController extends GetxController {
  final _generalRepository = locator<GeneralRepository>();
  RxBool isLoggedIn = false.obs;
  AboutAppModel? aboutModel;
  Rx<AboutType> aboutType = AboutType.farco.obs;
  void aboutFarco() async {
    aboutType.value = AboutType.farco;
    aboutModel = null;
    Get.to(AboutScreen());
    isLoggedIn.value = true;
    try {
      final result = await _generalRepository.aboutFarco();
      if (result.data != null) {
        isLoggedIn.value = false;
        aboutModel = result.data!;
      } else {}
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: e.message,
      ));
    } finally {
      isLoggedIn.value = false;
      //Dismiss Dialog .
      // Get.back();
    }
  }

  Future<bool> aboutApp() async {
    aboutType.value = AboutType.app;
    aboutModel = null;
    Get.to(AboutScreen());
    isLoggedIn.value = true;
    try {
      final result = await _generalRepository.aboutApp();
      if (result.data != null) {
        aboutModel = result.data!;
        isLoggedIn.value = false;
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: e.message,
      ));
      isLoggedIn.value = false;
      return false;
    } finally {
      //Dismiss Dialog .
      // Get.back();
    }
  }
}
