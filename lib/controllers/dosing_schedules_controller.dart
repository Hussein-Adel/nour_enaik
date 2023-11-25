import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/controllers/controllers.dart';

import '../constants/constants.dart';
import '../data/sqldb/sqldb.dart';
import '../ui/screens/add_new_dosing_screen.dart';

class DosingSchedulesController extends GetxController {
  var timeNow = DateTime.now();
  // integer that add to alarmId to set alarm in 24H
  int alarmIdIn24H = 1000;
  TextEditingController time12HController = TextEditingController(
      text:
          '${DateTime.now().hour > 12 ? (DateTime.now().hour - 12).toString() : DateTime.now().hour.toString()}:${DateTime.now().minute}');
  TextEditingController time24HController = TextEditingController(
      text:
          '${DateTime.now().hour > 12 ? DateTime.now().hour.toString() : (DateTime.now().hour + 12).toString()}:${DateTime.now().minute}');
  final GlobalKey<FormState> formDoseKey = GlobalKey<FormState>();
  TextEditingController treatmentNameController =
      TextEditingController(text: 'Alfabrimo');
  String treatmentImage = AppAssets.kAlfabrimo;
  final SqlDb _sqlDb = SqlDb();

  RxInt? selectedIndex = 0.obs;
  RxBool showFiled = false.obs;
  RxBool generalStatus = false.obs;
  RxBool newDoseStatus = true.obs;
  RxList<AlarmModel> alarmsList = <AlarmModel>[].obs;
  RxList<DoseModel> dropDownDosesList = <DoseModel>[
    DoseModel(treatmentName: 'Alfabrimo', treatmentImage: AppAssets.kAlfabrimo),
    DoseModel(treatmentName: 'Brintimo', treatmentImage: AppAssets.kBrintimo),
    DoseModel(treatmentName: 'أخرى', treatmentImage: AppAssets.kMedicine),
  ].obs;

  choseDose(DoseModel value) {
    if (dropDownDosesList.last == value) {
      treatmentNameController.text = value.treatmentName!;
      treatmentImage = AppAssets.kAlfabrimo;
      showFiled.value = true;
    } else {
      treatmentNameController.text = value.treatmentName!;
      treatmentImage = value.treatmentImage!;
      showFiled.value = false;
    }
  }

  void changeGeneralStatus(bool status) {
    generalStatus.value = status;
    for (int i = 0; i < alarmsList.length; i++) {
      changeSelectedAlarmStatus(index: i, status: status);
    }
  }

  changeNewDoseStatus(bool? status) {
    newDoseStatus.value = status ?? false;
  }

  //update ScheduleNotification Status
  changeSelectedAlarmStatus({required int index, required bool status}) {
    alarmsList[index].doseStatus?.value = status;
    AlarmModel alarm = alarmsList[index];
    _sqlDb.updateAlarmIntoDataBase(alarm);
    if (status) {
      createScheduleNotification(alarm: alarmsList[index]);
    } else {
      cancelScheduleNotification(index: index);
    }
    update();
  }

  //cancel ScheduleNotification
  cancelScheduleNotification({required int index}) {
    AwesomeNotifications().cancelSchedule(alarmsList[index].id!);
    // cancelSchedule in 24H
    AwesomeNotifications().cancelSchedule(alarmsList[index].id! + alarmIdIn24H);
  }

  // create ScheduleNotification
  createScheduleNotification({required AlarmModel alarm}) {
    // add first alarm in 12H
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: alarm.id ?? 0,
            channelKey: 'alarm key',
            title: 'منبة الجرعة',
            body: alarm.treatmentName,
            summary: alarm.doseTime12H,
            category: NotificationCategory.Alarm,
            bigPicture: "asset://${alarm.treatmentImage}",
            wakeUpScreen: true,
            criticalAlert: true,
            notificationLayout: NotificationLayout.BigPicture,
            actionType: ActionType.SilentAction),
        schedule: NotificationCalendar(
          hour: int.parse(alarm.doseTime12H!.split(':').first),
          minute: int.parse(alarm.doseTime12H!.split(':').last),
          preciseAlarm: true,
          allowWhileIdle: true,
        ));
    // add first alarm in 24H
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: alarm.id ?? 0,
            channelKey: 'alarm key',
            title: 'منبة الجرعة',
            body: alarm.treatmentName,
            summary: alarm.doseTime24H,
            category: NotificationCategory.Alarm,
            bigPicture: "asset://${alarm.treatmentImage}",
            wakeUpScreen: true,
            criticalAlert: true,
            notificationLayout: NotificationLayout.BigPicture,
            actionType: ActionType.SilentAction),
        schedule: NotificationCalendar(
          hour: int.parse(alarm.doseTime24H!.split(':').first),
          minute: int.parse(alarm.doseTime24H!.split(':').last),
          preciseAlarm: true,
          allowWhileIdle: true,
        ));
  }

  // Select Alarm and set Data To Update Alarm
  selectAlarmToUpdate(int index) {
    treatmentNameController.text = alarmsList[index].treatmentName ?? '';
    treatmentImage = alarmsList[index].treatmentImage!;
    time12HController.text = alarmsList[index].doseTime12H!;
    time24HController.text = alarmsList[index].doseTime24H!;
    newDoseStatus = alarmsList[index].doseStatus!;
    selectedIndex = index.obs;
    Get.to(AddNewDosingScreen());
  }

  //update Alarm if user chose dose to update
  updateAlarm() async {
    cancelScheduleNotification(index: selectedIndex!.value);
    // record alarm to use it to update it an database
    AlarmModel alarm = AlarmModel(
        id: alarmsList[selectedIndex!.value].id,
        treatmentName: treatmentNameController.text,
        treatmentImage: treatmentImage,
        doseTime12H: time12HController.text,
        doseTime24H: time24HController.text,
        doseStatus: newDoseStatus);

    // update alarm in alarmList
    alarmsList[selectedIndex!.value] = alarm;
    // update alarm in SqlDataBase
    // await _sqlDb.deleteAlarmFromDataBase(alarm.id);
    await _sqlDb.updateAlarmIntoDataBase(alarm);
    // reset selectedIndex
    selectedIndex = null;

    // create Notifications with schedule
    createScheduleNotification(alarm: alarm);
    Get.back();
  }

  //add Alarm
  addAlarm() async {
    await AwesomeNotifications().requestPermissionToSendNotifications();
    if (formDoseKey.currentState?.validate() != true) return false;
    // record alarm to use it to set it an database
    AlarmModel alarm = AlarmModel(
        treatmentName: treatmentNameController.text,
        treatmentImage: treatmentImage,
        doseTime12H: time12HController.text,
        doseTime24H: time24HController.text,
        doseStatus: newDoseStatus);
    // add alarm to Database
    _sqlDb.addAlarmToDataBase(alarm: alarm);
    // get all alarms after set id to each one of them and set all in list
    alarmsList.value
      ..clear()
      ..addAll(await _sqlDb.getAlarmsFromDataBase());
    // create Notifications with schedule
    createScheduleNotification(alarm: alarmsList.last);

    update();
    Get.back();
  }

  //delete Alarm from NotificationsSchedule , SqlDatabase , AlarmList
  deleteAlarm(int index) {
    //cancelNotification
    cancelScheduleNotification(index: index);
    // delete alarm from database and list
    _sqlDb.deleteAlarmFromDataBase(alarmsList[index].id ?? 0);
    alarmsList.removeAt(index);
    update();
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    print("Creaaaaaaaaaaate");
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
    MainController mainScreenController = Get.find();
    mainScreenController.playAlarm(receivedNotification);
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    MainController mainScreenController = Get.find();
    mainScreenController.playAlarm(receivedAction);
  }
}

class AlarmModel {
  int? id;
  String? treatmentName;
  String? treatmentImage;
  String? doseTime12H;
  String? doseTime24H;
  RxBool? doseStatus;
  AlarmModel({
    this.id,
    this.treatmentName,
    this.treatmentImage,
    this.doseTime12H,
    this.doseTime24H,
    this.doseStatus,
  });
}

class DoseModel {
  String? treatmentName;
  String? treatmentImage;

  DoseModel({this.treatmentName, this.treatmentImage});
}
