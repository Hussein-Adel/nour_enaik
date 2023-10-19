import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../components/components.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

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
                  height: 27.5.h,
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
                          Icon(
                            Icons.menu,
                            size: 25.sp,
                            color: Colors.white,
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                            child: Text(
                              'اهلا هاجر',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.sp),
                            ),
                          ),
                          Icon(
                            Icons.person_pin,
                            size: 40.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Text(
                        'ماذا يدور في بالك اليوم؟',
                        style: TextStyle(
                            color: Colors.grey, fontSize: AppFontSizes.kS4),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: 1.5.w,
                          ),
                          const Icon(
                            Icons.date_range_sharp,
                            color: Colors.white,
                          ),
                          const Text(
                            '07-JUN-2023',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 5.5.w,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                PositionedDirectional(
                  bottom: -2.h,
                  start: 30.w,
                  child: EmptyCard(
                    height: 5.h,
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
            height: 67.5.h,
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
                  const DrawerComponent(text: 'نور عينيك'),
                  const DrawerComponent(text: 'تذكير بالقطرات'),
                  const DrawerComponent(text: 'فحوصاتي'),
                  const DrawerComponent(text: 'نصائح'),
                  const DrawerComponent(text: 'حسابي'),
                  const DrawerComponent(text: 'نقاطي'),
                  const DrawerComponent(text: 'تواصل مع طبيبك'),
                  const DrawerComponent(text: 'تسجيل الخروج'),
                  const DrawerComponent(
                    text: 'عن فاركو',
                    divider: false,
                  ),
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
  const DrawerComponent({super.key, required this.text, this.divider = true});
  final String text;
  final bool? divider;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.darkGray,
              )
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
    );
  }
}
