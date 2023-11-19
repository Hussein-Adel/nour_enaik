import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/controllers/controllers.dart';

import '../constants/constants.dart';
import '../data/sqldb/sqldb.dart';
import '../ui/screens/add_new_dosing_screen.dart';

class DosingSchedulesController extends GetxController {
  TextEditingController timeController = TextEditingController(text: '12:00');
  final GlobalKey<FormState> formDoseKey = GlobalKey<FormState>();
  TextEditingController treatmentNameController =
      TextEditingController(text: 'دواء 1');
  final SqlDb _sqlDb = SqlDb();

  RxInt? selectedIndex = 0.obs;
  RxBool showFiled = false.obs;
  RxBool generalStatus = false.obs;
  RxBool newDoseStatus = false.obs;
  RxList<DoseModel> dosesList = <DoseModel>[].obs;
  RxList<DoseModel> dropDownDosesList = <DoseModel>[
    DoseModel(
        treatmentName: 'دواء 1', doseTime: '12:00 Am', doseStatus: false.obs),
    DoseModel(
        treatmentName: 'دواء 2', doseTime: '12:00 Am', doseStatus: true.obs),
    DoseModel(
        treatmentName: 'دواء 3', doseTime: '12:00 Am', doseStatus: true.obs),
    DoseModel(
        treatmentName: 'دواء 4', doseTime: '12:00 Am', doseStatus: false.obs),
    DoseModel(
        treatmentName: 'أخرى', doseTime: '12:00 Am', doseStatus: false.obs),
  ].obs;

  choseDose(DoseModel value) {
    if (dropDownDosesList.last == value) {
      treatmentNameController.text = value.treatmentName!;
      showFiled.value = true;
    } else {
      treatmentNameController.text = value.treatmentName!;
      showFiled.value = false;
    }
  }

  void changeGeneralStatus(bool status) {
    generalStatus.value = status;
  }

  changeNewDoseStatus(bool? status) {
    newDoseStatus.value = status ?? false;
  }

  changeSelectedDoseStatus(int index, bool status) {
    dosesList[index].doseStatus?.value = status;
    DoseModel dose = dosesList[index];
    _sqlDb.updateAlarmIntoDataBase(dose);
    if (status) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: dose.id ?? 0,
              channelKey: 'alarm key',
              title: 'منبة الجرعة',
              body: dose.treatmentName,
              summary: dose.doseTime,
              category: NotificationCategory.Alarm,
              bigPicture: "asset://${AppAssets.kMedicine}",
              wakeUpScreen: true,
              criticalAlert: true,
              notificationLayout: NotificationLayout.BigPicture,
              actionType: ActionType.SilentAction),
          schedule: NotificationCalendar(
            hour: int.parse(dose.doseTime!.split(':').first),
            minute: int.parse(dose.doseTime!.split(':').last),
            preciseAlarm: true,
            allowWhileIdle: true,
          ));
    } else {
      AwesomeNotifications().cancelSchedule(dosesList[index].id!);
    }
    update();
  }

  updateOrDeleteDoes(int index, String status) {
    if (status == UpdateDoes.delete.name) {
      // delete alarm from database and list
      _sqlDb.deleteAlarmFromDataBase(dosesList[index].id ?? 0);
      dosesList.removeAt(index);
    } else {
      treatmentNameController.text = dropDownDosesList[0].treatmentName!;
      timeController.text = dosesList[index].doseTime!;
      newDoseStatus = dosesList[index].doseStatus!;
      selectedIndex = index.obs;
      Get.to(AddNewDosingScreen());
    }
    update();
  }

  addDose() async {
    await AwesomeNotifications().requestPermissionToSendNotifications();
    if (formDoseKey.currentState?.validate() != true) return false;
    // record dose to use it to set it an database
    DoseModel dose = DoseModel(
        treatmentName: treatmentNameController.text,
        doseTime: timeController.text,
        doseStatus: newDoseStatus);
    //update dose if user chose dose to update
    if (selectedIndex != null) {
      dosesList[selectedIndex!.value] = dose;
      _sqlDb.updateAlarmIntoDataBase(dose);
    }
    // add new dose
    else {
      dosesList.add(
        dose,
      );
    }
    selectedIndex = null;

    _sqlDb.addAlarmToDataBase(
      dose: dose,
    );

    //get all Alarms to set id of each alarm to Use it later in delete or update
    dosesList.value.clear();
    dosesList.value = await _sqlDb.getAlarmsFromDataBase();

    // create Notifications with schedule
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: dosesList.last.id ?? 0,
            channelKey: 'alarm key',
            title: 'منبة الجرعة',
            body: dosesList.last.treatmentName,
            summary: dosesList.last.doseTime,
            category: NotificationCategory.Alarm,
            bigPicture: "asset://${AppAssets.kMedicine}",
            wakeUpScreen: true,
            criticalAlert: true,
            notificationLayout: NotificationLayout.BigPicture,
            actionType: ActionType.SilentAction),
        schedule: NotificationCalendar(
          hour: int.parse(timeController.text.split(':').first),
          minute: int.parse(timeController.text.split(':').last),
          preciseAlarm: true,
          allowWhileIdle: true,
        ));
    update();
    Get.back();
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

class DoseModel {
  int? id;
  String? treatmentName;
  String? doseTime;
  RxBool? doseStatus;
  DoseModel({
    this.id,
    this.treatmentName,
    this.doseTime,
    this.doseStatus,
  });
}
