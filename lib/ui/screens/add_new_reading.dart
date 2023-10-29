import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import '../components/components.dart';

class AddNewReadingScreen extends StatelessWidget {
  AddNewReadingScreen({super.key});
  final EyePressureController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseScreen(
        isLoading: controller.isLoggedIn.value,
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
                    'تسجيل قراءة جديدة',
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
                horizontalPadding: 7.5.w,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'التاريخ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                          fontSize: AppFontSizes.kS4,
                        ),
                      ),
                      EmptyCard(
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        shadow: true,
                        radius: 10,
                        child: CalendarDatePicker(
                            initialDate: DateTime(2022, 12, 17),
                            firstDate: DateTime(2012, 1, 1),
                            lastDate: DateTime(2032, 1, 1),
                            onDateChanged: controller.onDateChangedDate),
                      ),
                      Text(
                        'القراءة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                          fontSize: AppFontSizes.kS4,
                        ),
                      ),
                      EmptyCard(
                        verticalPadding: 1.h,
                        shadow: true,
                        radius: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => controller.addCount(),
                                  child: const Icon(
                                    Icons.keyboard_arrow_up_sharp,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.minusCount(),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7.5.w, vertical: 0.25.h),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.lightGrey3)),
                              child: Text(
                                '${controller.count}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkBlue,
                                  fontSize: AppFontSizes.kS9,
                                ),
                              ),
                            ),
                            Text(
                              'مم زئبقي',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkGray,
                                fontSize: AppFontSizes.kS4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: EmptyCard(
                              verticalPadding: 0,
                              color: AppColors.blue,
                              width: 25.w,
                              height: 15.w,
                              child: GestureDetector(
                                onTap: () => controller.storeEyePressure(),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 25.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
