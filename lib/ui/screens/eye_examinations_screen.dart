import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class EyeExaminationsScreen extends StatefulWidget {
  const EyeExaminationsScreen({super.key});

  @override
  State<EyeExaminationsScreen> createState() => _EyeExaminationsScreenState();
}

EyeExaminations eyeExaminations = EyeExaminations.date;

class _EyeExaminationsScreenState extends State<EyeExaminationsScreen> {
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
                  'فحص قاع العين',
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
          Expanded(
            child: EmptyCard(
              verticalPadding: 0.5.h,
              verticalMargin: 0,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(35), topLeft: Radius.circular(35)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              eyeExaminations = EyeExaminations.gallery;
                            });
                          },
                          child: TextBuilder(
                            text: 'معرض الصور',
                            bold: true,
                            color: eyeExaminations == EyeExaminations.gallery
                                ? AppColors.darkBlue
                                : AppColors.darkGray,
                          ),
                        ),
                        const VerticalDividerBuilder(
                          dividerColor: AppColors.darkGray,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              eyeExaminations = EyeExaminations.date;
                            });
                          },
                          child: TextBuilder(
                            text: 'التاريخ المرضي',
                            bold: true,
                            color: eyeExaminations == EyeExaminations.date
                                ? AppColors.darkBlue
                                : AppColors.darkGray,
                          ),
                        ),
                        const VerticalDividerBuilder(
                          dividerColor: AppColors.darkGray,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              eyeExaminations = EyeExaminations.addPhoto;
                            });
                          },
                          child: TextBuilder(
                            text: 'رفع صورة جديدة',
                            bold: true,
                            color: eyeExaminations == EyeExaminations.addPhoto
                                ? AppColors.darkBlue
                                : AppColors.darkGray,
                          ),
                        ),
                      ],
                    ),
                    eyeExaminations == EyeExaminations.date
                        ? Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios_sharp,
                                      color: AppColors.darkGray,
                                      size: 20.sp,
                                    ),
                                    const Spacer(),
                                    TextBuilder(
                                      text: 'ديسمبر  2022 ',
                                      color: Colors.black,
                                      size: AppFontSizes.kS6,
                                      bold: true,
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.darkGray,
                                        size: 25.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Icon(
                                      Icons.menu,
                                      size: 20.sp,
                                    ),
                                  ],
                                ),
                              ),
                              const EyeExaminationsComponents(),
                              const EyeExaminationsComponents(),
                              const EyeExaminationsComponents(),
                              const EyeExaminationsComponents(),
                              const EyeExaminationsComponents(),
                              const EyeExaminationsComponents(),
                              const EyeExaminationsComponents(),
                              GestureDetector(
                                child: EmptyCard(
                                  verticalPadding: 0,
                                  color: AppColors.cyan,
                                  width: 15.w,
                                  height: 15.w,
                                  radius: 50,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 22.5.sp,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : eyeExaminations == EyeExaminations.gallery
                            ? GridView.builder(
                                itemCount: 22,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        childAspectRatio: 0.9,
                                        mainAxisSpacing: 0.1.w,
                                        crossAxisSpacing: 0.25.w),
                                itemBuilder: (_, index) {
                                  return Image.asset(
                                    AppAssets.kEyeImage,
                                  );
                                },
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                    width: 80.w,
                                    child: DottedBorder(
                                      borderPadding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      dashPattern: const [9, 2.5],
                                      strokeWidth: 0.6.w,
                                      color: AppColors.cyan,
                                      borderType: BorderType.RRect,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.w),
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
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: Text(
                                          'تسجيل ملاحظات',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkBlue,
                                            fontSize: AppFontSizes.kS3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  EmptyCard(
                                      height: 10.h,
                                      width: 80.w,
                                      radius: 10,
                                      verticalMargin: 0,
                                      horizontalMargin: 0,
                                      shadow: true,
                                      child: const SizedBox()),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: Text(
                                          'التاريخ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.darkBlue,
                                            fontSize: AppFontSizes.kS3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  EmptyCard(
                                    verticalPadding: 0,
                                    horizontalPadding: 0,
                                    horizontalMargin: 6.w,
                                    shadow: true,
                                    radius: 10,
                                    child: CalendarDatePicker(
                                        initialDate: DateTime(2022, 12, 17),
                                        firstDate: DateTime(2022, 1, 1),
                                        lastDate: DateTime(2023, 1, 1),
                                        onDateChanged: (value) {}),
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
                                            onTap: () => Get.back(),
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

class EyeExaminationsComponents extends StatelessWidget {
  const EyeExaminationsComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EmptyCard(
          verticalPadding: 1.25.h,
          verticalMargin: 0,
          width: 70.w,
          radius: 10,
          horizontalMargin: 4.w,
          color: Colors.cyan.withOpacity(0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.white,
              ),
              const Spacer(),
              TextBuilder(
                text: 'تسجيل الفحوصات للعين',
                size: 11.sp,
                bold: true,
                color: Colors.white,
                verticalPadding: 0,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 7.5.h,
          width: 5.w,
          child: Stack(
            children: [
              PositionedDirectional(
                start: 1.5.w,
                child: VerticalDividerBuilder(
                  dividerColor: AppColors.lightGrey3,
                  width: 0.16.w,
                  height: 7.5.h,
                ),
              ),
              PositionedDirectional(
                top: 2.25.h,
                start: 0.9.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.lightGrey2,
                  radius: 0.75.w,
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            Text(
              '10',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.navyBlue,
                fontSize: AppFontSizes.kS7,
              ),
            ),
            TextBuilder(
              text: 'Wed',
              verticalPadding: 0,
              color: AppColors.darkGray,
              size: AppFontSizes.kS3,
            ),
          ],
        ),
      ],
    );
  }
}
