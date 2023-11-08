import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/ui/screens/profile_screen.dart';

import '../ui/screens/screens.dart';

class MainScreenController extends GetxController {
  RxInt currentIndex = 1.obs;

  void onBottomSheetChanged(int index, BuildContext context) {
    // if (context.mounted) {
    //   if (index == 1) {
    //   } else if (index == 2) {
    //   } else if (index == 3) {}
    // }
    currentIndex.value = index;
  }

  Future<bool> onWillPop(BuildContext context) async {
    if (currentIndex.value == 1) {
      return true;
    } else {
      currentIndex.value = 1;
      return false;
    }
  }

  List<Widget> homeScreensList = [
    const AlarmScreen(),
    HomeScreen(),
    DosingSchedulesScreen(),
    ProfileScreen(),
    HomeScreen(),
  ];
}
