import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/di/locator.dart';
import '../data/models/response/response.dart';
import '../data/repository/repository.dart';
import '../ui/components/build_chart.dart';

class EyePressureController extends GetxController {
  final _eyeRepository = locator<EyeRepository>();
  RxList<EyePressureModel> eyePressuresList = <EyePressureModel>[].obs;
  RxList<ReadingData> chartDataList = <ReadingData>[].obs;
  RxBool isLoggedIn = false.obs;
  String? date;
  RxInt count = 0.obs;
  addCount() {
    count.value = count.value + 1;
  }

  minusCount() {
    if (count.value > 1) count.value = count.value - 1;
  }

  void onDateChangedDate(DateTime value) {
    date = '${value.day}-${value.month}-${value.year}';
  }

  void getEyePressure() async {
    isLoggedIn.value = true;
    try {
      final result = await _eyeRepository.getEyePressure();
      if (result.data != null) {
        isLoggedIn.value = false;
        eyePressuresList.value = result.data!;
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

  void storeEyePressure() async {
    isLoggedIn.value = true;
    try {
      var data = {
        'date': date ?? '-7-2022',
        'reading': '${count.value}',
      };
      final result = await _eyeRepository.storeEyePressure(data);
      if (result.data != null) {
        isLoggedIn.value = false;
        eyePressuresList.value = result.data!;
        eyePressuresList.value.forEach((element) {
          if (element.date != null && element.reading != null) {
            chartDataList.add(
              ReadingData(
                element.date!.split('-').first,
                int.parse(element.reading!),
              ),
            );
          }
        });
        // chartDataList.forEach((element) {
        //   print('${element.x} :${element.y}');
        // });
        Get.back();
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
