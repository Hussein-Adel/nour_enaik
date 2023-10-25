import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/ui/screens/add_new_dosing_screen.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import '../components/components.dart';
import 'screens.dart';

class DosingSchedulesScreen extends StatelessWidget {
  DosingSchedulesScreen({super.key});
  final DosingSchedulesController controller =
      Get.put(DosingSchedulesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseScreen(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  EmptyCard(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(AddNewDosingScreen()),
                          child: Icon(
                            Icons.add,
                            size: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                          child: Text(
                            'تسجيل الجرعة',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(const DrawerScreen()),
                          child: Icon(
                            Icons.menu,
                            size: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5.w),
                      Text(
                        'ضبط تلقائي',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: FlutterSwitch(
                          width: 14.w,
                          height: 3.25.h,
                          valueFontSize: 9.sp,
                          toggleSize: 10.sp,
                          value: controller.generalStatus.value,
                          borderRadius: 30.0,
                          padding: 8.0,
                          showOnOff: true,
                          onToggle: controller.changeGeneralStatus,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  GetBuilder<DosingSchedulesController>(
                    builder: (controller) => SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                          itemCount: controller.dosesList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SchedulesItem(
                              model: controller.dosesList[index],
                              changeStatus: (value) =>
                                  controller.changeStatus(index, value),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              height: 30.h,
              width: 100.w,
              bottom: 3.h,
              child: Image.asset(AppAssets.kLogoNourEnaik),
            ),
          ],
        ),
      ),
    );
  }
}

class SchedulesItem extends StatelessWidget {
  const SchedulesItem(
      {super.key, required this.model, required this.changeStatus});
  final DoseModel model;
  final Function(bool) changeStatus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Icon(
            Icons.more_vert_sharp,
            color: AppColors.lightGrey,
            size: 22.5.sp,
          ),
          SizedBox(width: 1.5.w),
          Text(
            model.treatmentName ?? '',
            style: TextStyle(color: Colors.white, fontSize: 13.5.sp),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
            child: Text(
              model.doseTime ?? '',
              style: TextStyle(color: Colors.white, fontSize: 13.5.sp),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: FlutterSwitch(
              width: 14.w,
              height: 3.25.h,
              valueFontSize: 9.sp,
              toggleSize: 10.sp,
              value: model.doseStatus?.value ?? false,
              borderRadius: 30.0,
              padding: 8.0,
              showOnOff: true,
              onToggle: changeStatus,
            ),
          ),
        ],
      ),
    );
  }
}
