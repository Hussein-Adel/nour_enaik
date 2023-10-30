import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/constants.dart';
import '../data/di/locator.dart';
import '../data/models/response/response.dart';
import '../data/repository/repository.dart';

class EyeExaminationsController extends GetxController {
  RxList<EyeSightModel> eyeSightsList = <EyeSightModel>[].obs;
  final _eyeRepository = locator<EyeRepository>();
  RxBool isLoggedIn = false.obs;
  String? date;
  Rx<EyeExaminationsType> eyeExaminations = EyeExaminationsType.date.obs;
  RxList<XFile> pickedImages = <XFile>[].obs;
  final ImagePicker _picker = ImagePicker();

  void onDateChangedDate(DateTime value) {
    date = '${value.day}-${value.month}-${value.year}';
  }

  TextEditingController notesControllers = TextEditingController();
  deleteImage(int index) {
    pickedImages.removeAt(index);
  }

  getMultiImageFromGallery() async {
    List<XFile> images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      pickedImages.addAll(images);
    }
  }

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
      var data = dio.FormData.fromMap({
        'date': date ?? '-7-2022',
        'notes': notesControllers.text,
        'images': pickedImages
            .map((e) => dio.MultipartFile.fromFileSync(
                  e.path, /*filename: e.path.split('/').last*/
                ))
            .toList(),
      });
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
