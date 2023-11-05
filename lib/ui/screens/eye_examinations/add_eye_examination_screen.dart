import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../controllers/controllers.dart';
import '../../components/components.dart';

class AddEyeExamination extends StatelessWidget {
  AddEyeExamination({super.key});
  final EyeExaminationsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var nowDate = DateTime.now();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
              width: 100.w,
              child: GestureDetector(
                onTap: controller.getMultiImageFromGallery,
                child: DottedBorder(
                  borderPadding: const EdgeInsets.symmetric(horizontal: 3),
                  dashPattern: const [9, 2.5],
                  strokeWidth: 0.6.w,
                  color: AppColors.cyan,
                  borderType: BorderType.RRect,
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  radius: const Radius.circular(12.5),
                  child: Center(
                    child: Icon(
                      Icons.add_rounded,
                      color: AppColors.cyan,
                      size: 50.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.5.h),
            controller.pickedImages.isEmpty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الصور',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                          fontSize: AppFontSizes.kS3,
                        ),
                      ),
                      Container(
                        height: controller.pickedImages.isEmpty ? 0 : 25.h,
                        margin: EdgeInsets.only(bottom: 3.5.h, top: 1.5.h),
                        width: 100.w,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.pickedImages.length,
                          itemBuilder: (context, index) {
                            XFile file = controller.pickedImages[index];
                            return Stack(
                              children: [
                                Container(
                                  height: 25.h,
                                  width: 50.w,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 1.25.w),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3.5)),
                                      image: DecorationImage(
                                          image: FileImage(
                                            File(file.path),
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                PositionedDirectional(
                                  end: 5.w,
                                  top: 1.5.h,
                                  child: GestureDetector(
                                    onTap: () => controller.deleteImage(index),
                                    child: Container(
                                      height: 15.sp,
                                      width: 15.sp,
                                      decoration: BoxDecoration(
                                        color: AppColors.cyan.withOpacity(0.6),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.close,
                                          color: AppColors.liteBlue,
                                          size: 12.5.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
            Text(
              'تسجيل ملاحظات',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
                fontSize: AppFontSizes.kS3,
              ),
            ),
            TextFormFieldBuilder(
              borderRadius: 10,
              controller: controller.notesControllers,
              color: Colors.white,
              shadow: true,
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
              maxLines: 4,
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Text(
              'التاريخ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
                fontSize: AppFontSizes.kS3,
              ),
            ),
            EmptyCard(
              verticalPadding: 0,
              horizontalPadding: 0,
              horizontalMargin: 0,
              shadow: true,
              radius: 10,
              child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate:
                      DateTime(nowDate.year + 1, nowDate.month, nowDate.day),
                  onDateChanged: controller.onDateChangedDate),
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
                      onTap: controller.examinationsType.value ==
                              ExaminationsType.eyeSight
                          ? controller.storeEyeSight
                          : controller.storeEyeFundus,
                      child: Icon(
                        Icons.arrow_forward,
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
    );
  }
}
