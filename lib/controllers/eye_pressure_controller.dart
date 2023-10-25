import 'package:get/get.dart';

class EyePressureController extends GetxController {
  RxInt count = 0.obs;
  addCount() {
    count.value = count.value + 1;
  }

  minusCount() {
    if (count.value > 1) count.value = count.value - 1;
  }
}
