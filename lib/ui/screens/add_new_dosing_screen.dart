import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import '../components/components.dart';

class AddNewDosingScreen extends StatelessWidget {
  AddNewDosingScreen({super.key});
  final DosingSchedulesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      horizontalPadding: 1.5.w,
      body: Obx(
        () => Form(
          key: controller.formDoseKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 3.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25.sp,
                          )),
                      Text(
                        'أضافة جرعة جديدة',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 7.5.w,
                      )
                    ],
                  ),
                ),
                DropDownBuilder(
                  value: controller
                      .dosesList.value[controller.selectedIndex?.value ?? 0],
                  items: controller.dosesList.value +
                      [
                        DoseModel(
                            treatmentName: 'أخرى',
                            doseTime: '12:00 Am',
                            doseStatus: false.obs),
                      ],
                  onChanged: (value) => controller.choseDose(value),
                ),
                controller.showFiled.value
                    ? TextFormFieldBuilder(
                        hint: 'أسم الدواء',
                        controller: controller.treatmentNameController,
                        validator: Validators.compose([
                          Validators.required('Required'),
                          Validators.minLength(1, 'Required')
                        ]),
                        shadow: true,
                        textInputAction: TextInputAction.done,
                      )
                    : const SizedBox(),
                SizedBox(
                  height: 20.h,
                  width: 100.w,
                  child: ZoneCard(
                    tittle: 'ميعاد الجرعة',
                    timeController: controller.timeController,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: controller.newDoseStatus.value,
                      onChanged: (value) =>
                          controller.changeNewDoseStatus(value),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const TextBuilder(
                      text: 'تفعيل التنبيه',
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 2.5.h),
                GestureDetector(
                  onTap: () {
                    controller.addDose();
                  },
                  child: EmptyCard(
                    verticalPadding: 0,
                    color: AppColors.cyan,
                    width: 75.w,
                    height: 9.w,
                    child: Center(
                      child: Text(
                        'حفظ',
                        style: TextStyle(
                            color: Colors.white, fontSize: AppFontSizes.kS4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
