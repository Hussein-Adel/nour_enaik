import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/constants/assets.dart';
import 'package:nour_enaik/ui/screens/profile_screen.dart';

import '../ui/screens/screens.dart';

class MainController extends GetxController {
  final player = AudioPlayer();
  RxInt currentIndex = 1.obs;
  int? notificationId;
  RxString notificationImage = AppAssets.kMedicine.obs;

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
    if (notificationId != null) {
      AwesomeNotifications().dismiss(notificationId!);
    }
  }

  delayAlarm() async {
    stopAlarm();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 9999,
          channelKey: 'delay key',
          title: 'منبة الجرعة',
          body: treatmentName.value,
          summary: alarmTime.value,
          category: NotificationCategory.Alarm,
          bigPicture: "asset://${notificationImage.value}",
          wakeUpScreen: true,
          criticalAlert: true,
          notificationLayout: NotificationLayout.BigPicture,
          actionType: ActionType.SilentAction),
      schedule: NotificationInterval(
        interval: 300,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        preciseAlarm: true,
      ),
    );
  }

  RxString alarmTime = ''.obs;
  RxString treatmentName = ''.obs;
  playAlarm(ReceivedNotification receivedNotification) async {
    notificationId = receivedNotification.id;
    alarmTime.value = receivedNotification.summary ?? '';
    treatmentName.value = receivedNotification.body ?? '';
    AssetImage? assetImage =
        receivedNotification.bigPictureImage as AssetImage?;
    notificationImage.value = assetImage?.assetName ?? AppAssets.kMedicine;
    Get.to(MainScreen());
    player.play(AssetSource('sounds/alarm.wav'));
    onBottomSheetChanged(0);
  }
}
