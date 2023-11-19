import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/controllers/controllers.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  final GeneralController controller = Get.put(GeneralController());
  final AuthController authController = Get.find();
  final MainController mainScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30.h,
            child: Stack(
              children: [
                EmptyCard(
                  height: 25.h,
                  verticalMargin: 0,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  path: AppAssets.kHomeBag,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 6.5.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                            child: Text(
                              ' اهلا ${authController.currentUser?.user?.name}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.sp),
                            ),
                          ),
                          Icon(
                            Icons.person_pin,
                            size: 40.sp,
                            color: Colors.white,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.close_rounded,
                              size: 22.5.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        'ماذا يدور في بالك اليوم؟',
                        style: TextStyle(
                            color: Colors.white60, fontSize: AppFontSizes.kS5),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                    ],
                  ),
                ),
                PositionedDirectional(
                  bottom: 0,
                  start: 22.5.w,
                  child: EmptyCard(
                    height: 5.h,
                    horizontalPadding: 12.5.w,
                    verticalPadding: 0,
                    shadow: true,
                    child: const Center(
                      child: Text(
                        'تعديل الصفحة الشخصية',
                        style: TextStyle(color: AppColors.darkBlue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          EmptyCard(
            shadow: true,
            height: 70.h,
            horizontalPadding: 0,
            verticalMargin: 0,
            verticalPadding: 0,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  DrawerComponent(
                      text: 'نور عينيك', onTap: controller.aboutApp),
                  DrawerComponent(
                      text: 'تذكير بالقطرات',
                      onTap: () {
                        mainScreenController.onBottomSheetChanged(2);
                        Get.back();
                      }),
                  DrawerComponent(
                      text: 'فحوصاتي',
                      onTap: () {
                        mainScreenController.onBottomSheetChanged(1);
                        Get.back();
                      }),
                  DrawerComponent(text: 'نصائح', onTap: () {}),
                  DrawerComponent(
                      text: 'حسابي',
                      onTap: () {
                        mainScreenController.onBottomSheetChanged(3);
                        Get.back();
                      }),
                  DrawerComponent(text: 'نقاطي', onTap: () {}),
                  DrawerComponent(text: 'تواصل مع طبيبك', onTap: () {}),
                  DrawerComponent(
                      text: 'تسجيل الخروج', onTap: authController.logout),
                  DrawerComponent(
                      text: 'عن فاركو',
                      divider: false,
                      onTap: controller.aboutFarco),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerComponent extends StatelessWidget {
  const DrawerComponent(
      {super.key,
      required this.text,
      this.divider = true,
      required this.onTap});
  final String text;
  final bool? divider;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 1.h),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: AppFontSizes.kS4,
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.darkGray,
                  size: 25.sp,
                ),
              ],
            ),
          ),
          divider!
              ? DividerBuilder(
                  dividerColor: AppColors.lightGrey2,
                  width: 100.w,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
