import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';
import '../data/di/locator.dart';
import '../data/models/response/response.dart';
import '../data/repository/repository.dart';

class EyeExaminationsController extends GetxController {
  RxList<EyeSightModel> eyeSightsList = <EyeSightModel>[].obs;
  Rx<ExaminationsType> examinationsType = ExaminationsType.eyeSight.obs;
  final _eyeRepository = locator<EyeRepository>();
  RxBool isLoading = false.obs;
  String? date;
  RxList<String>? allImages = <String>[].obs;
  Rx<EyeExaminationsType> eyeExaminations = EyeExaminationsType.date.obs;
  RxList<XFile> pickedImages = <XFile>[].obs;
  final ImagePicker _picker = ImagePicker();
  TextEditingController notesControllers = TextEditingController();

  void onDateChangedDate(DateTime value) {
    DateFormat format = DateFormat("dd MMMM yyyy");
    date = format.format(value);
    print("new Format $date");
  }

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
    examinationsType.value = ExaminationsType.eyeSight;
    clearFunction();
    eyeSightsList.clear();
    isLoading.value = true;
    try {
      final result = await _eyeRepository.getEyeSight();
      if (result.data != null) {
        isLoading.value = false;
        eyeSightsList.value = result.data!;

        eyeSightsList.forEach((model) {
          allImages!.addAll(model.images!);
        });
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
      isLoading.value = false;
      //Dismiss Dialog .
      // Get.back();
    }
  }

  void storeEyeSight() async {
    eyeSightsList.clear();
    var nowDate = DateTime.now();
    isLoading.value = true;
    try {
      var data = dio.FormData.fromMap({
        'date': date ?? '${nowDate.day} ${nowDate.month} ${nowDate.year}',
        'notes': notesControllers.text,
        'images[]': pickedImages
            .map((e) => dio.MultipartFile.fromFileSync(
                  e.path, /*filename: e.path.split('/').last*/
                ))
            .toList(),
      });
      final result = await _eyeRepository.storeEyeSight(data);
      if (result.data != null) {
        isLoading.value = false;
        eyeSightsList.value = result.data!;
        eyeSightsList.forEach((model) {
          allImages!.addAll(model.images!);
        });
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
      isLoading.value = false;
      clearFunction();
      //Dismiss Dialog .
      // Get.back();
    }
  }

  void getEyeFundus() async {
    examinationsType.value = ExaminationsType.eyeFundus;
    eyeSightsList.clear();
    clearFunction();
    isLoading.value = true;
    try {
      final result = await _eyeRepository.getEyeFundus();
      if (result.data != null) {
        isLoading.value = false;
        eyeSightsList.value = result.data!;
        eyeSightsList.forEach((model) {
          allImages!.addAll(model.images!);
        });
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
      isLoading.value = false;
      //Dismiss Dialog .
      // Get.back();
    }
  }

  void storeEyeFundus() async {
    eyeSightsList.clear();
    var nowDate = DateTime.now();
    isLoading.value = true;
    try {
      var data = dio.FormData.fromMap({
        'date': date ?? '${nowDate.day} ${nowDate.month} ${nowDate.year}',
        'notes': notesControllers.text,
        'images[]': pickedImages
            .map((e) => dio.MultipartFile.fromFileSync(
                  e.path, /*filename: e.path.split('/').last*/
                ))
            .toList(),
      });
      final result = await _eyeRepository.storeEyeFundus(data);
      if (result.data != null) {
        isLoading.value = false;
        eyeSightsList.value = result.data!;
        eyeSightsList.forEach((model) {
          allImages!.addAll(model.images!);
        });
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
      isLoading.value = false;
      clearFunction();
      //Dismiss Dialog .
      // Get.back();
    }
  }

  clearFunction() {
    pickedImages.clear();
    date = '';
    eyeExaminations.value = EyeExaminationsType.date;
    notesControllers.clear();
    allImages = <String>[].obs;
  }
}
