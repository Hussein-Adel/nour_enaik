import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';
import 'screens.dart';

class NourEnaikLoginScreen extends StatelessWidget {
  const NourEnaikLoginScreen({super.key});

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
                  'تسجيل الدخول',
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
                    Text(
                      " ! " 'أهلا بعودتك',
                      style: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: AppFontSizes.kS4),
                    ),
                    TextFormFieldBuilder(
                      borderColor: Colors.transparent,
                      color: Colors.grey.withOpacity(0.1),
                      hint: 'البريد الإكتروني',
                      horizontalMargin: 7.5.w,
                      height: 5.h,
                    ),
                    TextFormFieldBuilder(
                      borderColor: Colors.transparent,
                      color: Colors.grey.withOpacity(0.1),
                      hint: 'كلمة المرور',
                      horizontalMargin: 7.5.w,
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        CheckBoxBuilder(
                          onChanged: (value) {},
                          value: true,
                          activeColor: Colors.grey.withOpacity(0.25),
                          checkColor: AppColors.cyan,
                        ),
                        Text(
                          'تذكرني',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        const Spacer(),
                        Text(
                          'نسيت كلمة المرور',
                          style: TextStyle(fontSize: 11.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Get.to(NourEnaikMainScreen()),
                      child: EmptyCard(
                        verticalPadding: 0,
                        color: AppColors.cyan,
                        width: 75.w,
                        height: 9.w,
                        child: Center(
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: AppFontSizes.kS4),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextBuilder(
                          verticalPadding: 2.5.h,
                          horizontalPadding: 1.w,
                          text: 'ليس لديك حساب ؟',
                          size: 11.sp,
                          bold: true,
                          color: AppColors.darkBlue.withOpacity(0.6),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(const NourEnaikSignUpScreen()),
                          child: TextBuilder(
                            color: AppColors.darkBlue.withOpacity(0.9),
                            text: ' إنشاء حساب',
                            size: 10.sp,
                            verticalPadding: 1.h,
                            horizontalPadding: 1.w,
                            bold: true,
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
    );
  }
}
