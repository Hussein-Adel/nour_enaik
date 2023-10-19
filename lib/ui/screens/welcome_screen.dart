import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';
import 'screens.dart';

class NourEnaikWelcomeScreen extends StatelessWidget {
  const NourEnaikWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                EmptyCard(
                  height: 30.h,
                  width: 100.w,
                  shadow: true,
                  verticalPadding: 0,
                  horizontalPadding: 0,
                  verticalMargin: 0,
                  path: AppAssets.kWelcomePage2,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35)),
                  child: const SizedBox(),
                ),
                EmptyCard(
                  height: 30.h,
                  width: 100.w,
                  shadow: true,
                  verticalPadding: 0,
                  horizontalPadding: 0,
                  verticalMargin: 0,
                  color: Colors.white.withOpacity(0.65),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35)),
                  child: const SizedBox(),
                ),
                PositionedDirectional(
                  start: 5.w,
                  bottom: 2.h,
                  child: Image.asset(
                    AppAssets.kLogoNourEnaik,
                    width: 32.5.w,
                    height: 25.h,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'أهلا',
              style: TextStyle(
                  color: AppColors.darkBlue.withOpacity(0.75),
                  fontSize: AppFontSizes.kS10),
            ),
            ButtonBuilder(
              title: 'تسجيل الدخول',
              height: 5.h,
              width: 70.w,
              titleColor: AppColors.darkGray,
              buttonColor: Colors.white,
              borderColor: Colors.transparent,
              elevation: 7.5,
              margin: EdgeInsets.symmetric(vertical: 2.5.h),
              onPressed: () => Get.to(const NourEnaikLoginScreen()),
            ),
            ButtonBuilder(
              title: 'إنشاء حساب',
              height: 5.h,
              width: 70.w,
              titleColor: AppColors.darkGray,
              buttonColor: Colors.white,
              borderColor: Colors.transparent,
              elevation: 7.5,
              onPressed: () => Get.to(const NourEnaikSignUpScreen()),
              margin: EdgeInsets.symmetric(vertical: 2.5.h),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Image.asset(
              AppAssets.kWelcomePage1,
              width: 60.w,
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}
