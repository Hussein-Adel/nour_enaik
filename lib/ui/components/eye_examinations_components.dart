import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import 'components.dart';

class EyeExaminationsComponents extends StatelessWidget {
  const EyeExaminationsComponents(
      {super.key, required this.date, required this.note});
  final String date;
  final String note;
  @override
  Widget build(BuildContext context) {
    List<String> dateList = date.split(' ');
    return Row(
      children: [
        EmptyCard(
          verticalPadding: 1.25.h,
          verticalMargin: 0,
          width: 68.w,
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
                text: note,
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
        SizedBox(
          width: 10.w,
          child: Column(
            children: [
              Text(
                dateList[0],
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.navyBlue,
                  fontSize: AppFontSizes.kS7,
                ),
              ),
              TextBuilder(
                text: dateList[1],
                maxLin: 1,
                verticalPadding: 0,
                color: AppColors.darkGray,
                size: AppFontSizes.kS3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
