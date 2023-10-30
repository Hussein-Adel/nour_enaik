import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../controllers/controllers.dart';
import '../../components/components.dart';

class EyeExaminationsDates extends StatelessWidget {
  EyeExaminationsDates({super.key});
  final EyeExaminationsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
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
          onTap: () => controller
              .changeEyeExaminationsType(EyeExaminationsType.addPhoto),
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
    );
  }
}
