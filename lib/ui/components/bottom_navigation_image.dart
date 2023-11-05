import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';

class BottomNavigationImage extends StatelessWidget {
  const BottomNavigationImage({
    Key? key,
    required this.isCurrentIndex,
    required this.image,
  }) : super(key: key);
  final bool isCurrentIndex;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      color: isCurrentIndex ? AppColors.cyan : AppColors.blue.withOpacity(0.75),
      width: isCurrentIndex ? 22.sp : 18.5.sp,
      height: isCurrentIndex ? 22.5.sp : 19.sp,
      fit: BoxFit.fill,
    );
  }
}
