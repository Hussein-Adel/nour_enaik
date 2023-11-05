import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  DateFormat format = DateFormat("dd MMMM yyyy");
  addCount() {
    count.value = count.value + 1;
  }

  minusCount() {
    if (count.value > 1) count.value = count.value - 1;
  }

  void onDateChangedDate(DateTime value) {
    date = format.format(value);
    List<String> x = date!.split(' ');

    print("new Format $date");
    print("old Format ${x[1]}");
  }

  void getEyePressure() async {
    isLoggedIn.value = true;
    try {
      final result = await _eyeRepository.getEyePressure();
      if (result.data != null) {
        eyePressuresList.clear();
        chartDataList.clear();
        isLoggedIn.value = false;
        eyePressuresList.value = result.data!;
        eyePressuresList.value.forEach((eyePressure) {
          if (eyePressure.date != null && eyePressure.reading != null) {
            List<String> readingDate = eyePressure.date!.split(' ');
            chartDataList.add(
              ReadingData(
                readingDate[1],
                int.parse(eyePressure.reading!),
              ),
            );
          }
        });
        chartDataList.forEach((element) {
          print(element.date);
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
      isLoggedIn.value = false;
      //Dismiss Dialog .
      // Get.back();
    }
  }

  void storeEyePressure() async {
    var nowDate = DateTime.now();
    isLoggedIn.value = true;
    try {
      var data = {
        'date': date ?? '${nowDate.day} ${nowDate.month} ${nowDate.year}',
        'reading': '${count.value}',
      };
      final result = await _eyeRepository.storeEyePressure(data);
      if (result.data != null) {
        eyePressuresList.clear();
        chartDataList.clear();
        isLoggedIn.value = false;
        eyePressuresList.value = result.data!;
        eyePressuresList.value.forEach((eyePressure) {
          if (eyePressure.date != null && eyePressure.reading != null) {
            List<String> readingDate = eyePressure.date!.split(' ');
            chartDataList.add(
              ReadingData(
                readingDate[1],
                int.parse(eyePressure.reading!),
              ),
            );
          }
        });
        chartDataList.forEach((element) {
          print('${element.reading} :${element.date}');
        });
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
