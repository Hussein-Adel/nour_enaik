import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
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
            PositionedDirectional(
              height: 30.h,
              width: 100.w,
              bottom: 3.h,
              child: Image.asset(AppAssets.kLogoNourEnaik),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EmptyCard(
                  height: 10.h,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.selectedIndex = null;
                          Get.to(AddNewDosingScreen());
                        },
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
                        onTap: () => Get.to(DrawerScreen()),
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
                    SizedBox(
                      width: 5.w,
                    ),
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
                  builder: (controller) => Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.alarmsList.length,
                      itemBuilder: (context, index) {
                        return SchedulesItem(
                          model: controller.alarmsList[index],
                          changeStatus: (value) =>
                              controller.changeSelectedAlarmStatus(
                                  index: index, status: value),
                          updateDoes: (value) {
                            value == "edite"
                                ? controller.selectAlarmToUpdate(index)
                                : controller.deleteAlarm(index);
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SchedulesItem extends StatelessWidget {
  const SchedulesItem(
      {super.key,
      required this.model,
      required this.changeStatus,
      required this.updateDoes});
  final AlarmModel model;
  final Function(bool) changeStatus;
  final Function(String) updateDoes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          PopupMenuButton(
            onSelected: updateDoes,
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: 'edite',
                  child: Text("تعديل"),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text("حذف"),
                ),
              ];
            },
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
              model.doseTime12H ?? '',
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
