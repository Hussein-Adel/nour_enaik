import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import 'components.dart';

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
