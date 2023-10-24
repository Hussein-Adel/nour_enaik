import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      verticalPadding: 0,
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  'منبة الجرعة',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSizes.kS9,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(width: 12.5.w),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              EmptyCard(
                verticalPadding: 0.5.h,
                verticalMargin: 3.h,
                horizontalMargin: 7.5.w,
                width: 100.w,
                height: 70.h,
                borderRadius: const BorderRadius.all(Radius.circular(35)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 2.5.h),
                      Image.asset(
                        AppAssets.kMedicine,
                        height: 55.h,
                      ),
                    ],
                  ),
                ),
              ),
              PositionedDirectional(
                end: 6.5.w,
                top: -2.h,
                child: EmptyCard(
                  radius: 50,
                  width: 12.5.w,
                  height: 12.5.w,
                  shadow: true,
                  verticalPadding: 0,
                  horizontalPadding: 0,
                  color: AppColors.green,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFontSizes.kS7,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              PositionedDirectional(
                start: 32.5.w,
                top: 7.5.h,
                child: Text(
                  '06:00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.green,
                    fontSize: 40.sp,
                  ),
                ),
              ),
              PositionedDirectional(
                start: 32.5.w,
                bottom: 15.h,
                child: Text(
                  'فارما تيرز',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.bBlue,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              PositionedDirectional(
                width: 75.w,
                start: 12.5.w,
                bottom: 5.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonBuilder(
                      title: 'تأجيل',
                      height: 4.5.h,
                      width: 30.w,
                      titleColor: AppColors.white,
                      buttonColor: AppColors.darkGray.withOpacity(0.5),
                      borderColor: Colors.transparent,
                      elevation: 7.5,
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                    ),
                    ButtonBuilder(
                      title: 'إيقاف',
                      height: 4.5.h,
                      width: 30.w,
                      titleColor: AppColors.darkGray,
                      buttonColor: Colors.white,
                      borderColor: Colors.transparent,
                      elevation: 7.5,
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
