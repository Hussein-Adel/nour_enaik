import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/screens.dart';

class MainScreenController extends GetxController {
  int currentIndex = 0;

  void onBottomSheetChanged(int index, BuildContext context) {
    if (context.mounted) {
      if (index == 1) {
      } else if (index == 2) {
      } else if (index == 3) {}
    }
    currentIndex = index;
  }

  Future<bool> onWillPop(BuildContext context) async {
    if (currentIndex == 0) {
      return true;
    } else {
      currentIndex = 0;
      return false;
    }
  }

  List<Widget> homeScreensList = [
    const NourEnaikHomeScreen(),
    const AlarmScreen(),
    const DosingSchedulesScreen(),
    const NourEnaikHomeScreen(),
    const NourEnaikHomeScreen(),
  ];
}
