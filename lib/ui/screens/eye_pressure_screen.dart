import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';
import 'screens.dart';

class EyePressureScreen extends StatelessWidget {
  const EyePressureScreen({super.key});

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
                GestureDetector(
                  onTap: () => Get.to(const AddNewReadingScreen()),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                ),
                const Spacer(),
                Text(
                  'ضغط العين',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSizes.kS9,
                      fontWeight: FontWeight.w800),
                ),
                const Spacer(),
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
          Expanded(
            child: EmptyCard(
              verticalPadding: 0.5.h,
              verticalMargin: 0,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35), topLeft: Radius.circular(35)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.error_outline_sharp,
                          color: AppColors.cyan,
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'مم زئبقي',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.navyBlue,
                                    fontSize: AppFontSizes.kS4,
                                  ),
                                ),
                                SizedBox(
                                  width: 1.5.w,
                                ),
                                Text(
                                  '23',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.navyBlue,
                                    fontSize: AppFontSizes.kS10,
                                  ),
                                ),
                              ],
                            ),
                            TextBuilder(
                              text: '${2023}  ديسمبر',
                              verticalPadding: 0,
                              color: AppColors.darkGray,
                              size: AppFontSizes.kS3,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          width: 10.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(2.5),
                            border: Border.all(
                                color: AppColors.black, width: 0.35.sp),
                          ),
                          child: Center(
                              child: Text(
                            'سنة',
                            style: TextStyle(
                              fontSize: 8.5.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue,
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Container(
                          width: 10.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                            color: AppColors.bLBlueWO,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                          child: Center(
                              child: Text(
                            'شهر',
                            style: TextStyle(
                              fontSize: 8.5.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        TextBuilder(
                          text: 'تحليل البيانات ',
                          bold: true,
                          size: AppFontSizes.kS3,
                          horizontalPadding: 0.25.w,
                          color: AppColors.darkBlue,
                        ),
                        Radio(value: 1, groupValue: 1, onChanged: (value) {}),
                      ],
                    ),
                    BuilderChart(
                      chartData: [
                        ChartData(0, 35),
                        ChartData(10, 25),
                        ChartData(20, 20),
                        ChartData(30, 27),
                        ChartData(40, 32),
                        ChartData(50, 22),
                      ],
                      max: 35,
                      min: 0,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(const AddNewReadingScreen()),
                      child: EmptyCard(
                        verticalPadding: 0,
                        color: AppColors.blue,
                        width: 55.w,
                        height: 10.w,
                        child: Center(
                          child: Text(
                            'إضافة قراءة جديدة',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppFontSizes.kS4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
