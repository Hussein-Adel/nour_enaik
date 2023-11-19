import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/ui/screens/profile_screen.dart';

import '../ui/screens/screens.dart';

class MainController extends GetxController {
  final player = AudioPlayer();
  RxInt currentIndex = 1.obs;

  void onBottomSheetChanged(int index) {
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
    const ProfileScreen(),
    HomeScreen(),
  ];
  stopAlarm() {
    player.stop();
  }

  RxString alarmTime = ''.obs;
  RxString treatmentName = ''.obs;
  playAlarm(ReceivedNotification receivedNotification) async {
    alarmTime.value = receivedNotification.summary ?? '';
    treatmentName.value = receivedNotification.body ?? '';
    Get.to(MainScreen());
    player.play(AssetSource('sounds/alarm.wav'));
    onBottomSheetChanged(0);
  }
}
