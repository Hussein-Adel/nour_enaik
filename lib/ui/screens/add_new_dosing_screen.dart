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
                      EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 5.h),
                  child: Text(
                    'أضافة جرعة جديدة',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormFieldBuilder(
                  hint: 'أسم الدواء',
                  controller: controller.treatmentNameController,
                  validator: Validators.compose([
                    Validators.required('Required'),
                    Validators.minLength(1, 'Required')
                  ]),
                  shadow: true,
                  textInputAction: TextInputAction.done,
                ),
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
                        'أضافة جرعة',
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
