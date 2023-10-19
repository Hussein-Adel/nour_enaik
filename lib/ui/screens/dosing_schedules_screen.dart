import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';
import 'screens.dart';

class DosingSchedulesScreen extends StatelessWidget {
  const DosingSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
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
                        onTap: () => Get.to(const DrawerScreen()),
                        child: Icon(
                          Icons.menu,
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
                      Icon(
                        Icons.add,
                        size: 40.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: FlutterSwitch(
                        width: 14.w,
                        height: 3.25.h,
                        valueFontSize: 9.sp,
                        toggleSize: 10.sp,
                        value: false,
                        borderRadius: 30.0,
                        padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {},
                      ),
                    ),
                    Text(
                      'ضبط تلقائي',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5.w)
                  ],
                ),
                const SchedulesItem(),
                const SchedulesItem(),
                const SchedulesItem(),
                const SchedulesItem(),
                const SchedulesItem(),
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
    );
  }
}

class SchedulesItem extends StatelessWidget {
  const SchedulesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: FlutterSwitch(
              width: 14.w,
              height: 3.25.h,
              valueFontSize: 9.sp,
              toggleSize: 10.sp,
              value: false,
              borderRadius: 30.0,
              padding: 8.0,
              showOnOff: true,
              onToggle: (val) {},
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
            child: Text(
              '12:00 Am',
              style: TextStyle(color: Colors.white, fontSize: 13.5.sp),
            ),
          ),
          const Spacer(),
          Text(
            'دورزولامول',
            style: TextStyle(color: Colors.white, fontSize: 13.5.sp),
          ),
          Icon(
            Icons.more_vert_sharp,
            color: AppColors.lightGrey,
            size: 22.5.sp,
          )
        ],
      ),
    );
  }
}
