import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../ui/screens/add_new_dosing_screen.dart';

class DosingSchedulesController extends GetxController {
  TextEditingController timeController = TextEditingController(text: '12:00');
  final GlobalKey<FormState> formDoseKey = GlobalKey<FormState>();
  TextEditingController treatmentNameController =
      TextEditingController(text: 'دواء 1');
  RxInt? selectedIndex = 0.obs;
  RxBool showFiled = false.obs;
  RxBool generalStatus = false.obs;
  RxBool newDoseStatus = false.obs;
  RxList<DoseModel> dosesList = <DoseModel>[
    DoseModel(
        treatmentName: 'دواء 1', doseTime: '12:00 Am', doseStatus: false.obs),
    DoseModel(
        treatmentName: 'دواء 2', doseTime: '12:00 Am', doseStatus: true.obs),
    DoseModel(
        treatmentName: 'دواء 3', doseTime: '12:00 Am', doseStatus: true.obs),
    DoseModel(
        treatmentName: 'دواء 4', doseTime: '12:00 Am', doseStatus: false.obs),
  ].obs;
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
  changeStatus(int index, bool status) {
    dosesList[index].doseStatus?.value = status;
    update();
  }

  updateOrDeleteDoes(int index, String status) {
    if (status == UpdateDoes.delete.name) {
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

  addDose() {
    if (formDoseKey.currentState?.validate() != true) return false;
    if (selectedIndex != null) {
      print(selectedIndex?.value);
      dosesList[selectedIndex!.value] = DoseModel(
          treatmentName: treatmentNameController.text,
          doseTime: '${timeController.text} Am',
          doseStatus: newDoseStatus);
    } else {
      print(timeController.text);
      dosesList.add(DoseModel(
          treatmentName: treatmentNameController.text,
          doseTime: '${timeController.text} Am',
          doseStatus: newDoseStatus));
    }
    selectedIndex = null;
    update();
    Get.back();
  }
}

class DoseModel {
  String? treatmentName;
  String? doseTime;
  RxBool? doseStatus;
  DoseModel({
    this.treatmentName,
    this.doseTime,
    this.doseStatus,
  });
}
