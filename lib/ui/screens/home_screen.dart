import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';
import 'screens.dart';

class NourEnaikHomeScreen extends StatelessWidget {
  const NourEnaikHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EmptyCard(
              color: Colors.transparent,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(const DrawerScreen()),
                    child: Icon(
                      Icons.menu,
                      size: 25.sp,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                    child: Text(
                      'اهلا هاجر',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  ),
                  Icon(
                    Icons.person_pin,
                    size: 40.sp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            TextFormFieldBuilder(
              borderColor: Colors.cyan.withOpacity(0.5),
              color: Colors.cyan.withOpacity(0.5),
              horizontalMargin: 7.5.w,
              height: 5.h,
              prefixIcon: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(25),
                    bottomStart: Radius.circular(25),
                  ),
                ),
                child: const Icon(Icons.search),
              ),
            ),
            ButtonBuilder(
              title: 'بحث',
              height: 5.h,
              width: 65.w,
              titleColor: AppColors.darkBlue,
              buttonColor: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 4.h),
            ),
            Container(
              height: 60.h,
              width: 100.w,
              color: AppColors.transparent,
              child: Stack(
                children: [
                  EmptyCard(
                    height: 30.h,
                    width: 100.w,
                    verticalMargin: 0,
                    path: AppAssets.kHomeBagImg,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          ': يمكنك البدء من خلال إختيار أحد الأختيارات التالية',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 3.5.h,
                    child: EmptyCard(
                      height: 30.h,
                      width: 100.w,
                      shadow: true,
                      verticalPadding: 0,
                      horizontalPadding: 0,
                      verticalMargin: 0,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeComponent(
                            image: AppAssets.kMagalEl2bsar,
                            text: 'فحص مجال الأبصار',
                            page: EyeExaminationsScreen(),
                          ),
                          HomeComponent(
                            image: AppAssets.kEyePressure,
                            text: 'ضغط العين',
                            page: EyePressureScreen(),
                          ),
                          HomeComponent(
                            image: AppAssets.kFa7sKa3El3in,
                            text: 'فحص قاع العين',
                            page: EyeExaminationsScreen(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeComponent extends StatelessWidget {
  const HomeComponent(
      {super.key, required this.text, required this.image, required this.page});
  final String text;
  final String image;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(page),
      child: Column(
        children: [
          EmptyCard(
            height: 11.5.h,
            width: 22.5.w,
            radius: 17.5,
            shadow: true,
            child: Image.asset(image),
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}