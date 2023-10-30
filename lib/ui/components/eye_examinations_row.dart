import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import 'components.dart';

class ExaminationsRow extends StatelessWidget {
  ExaminationsRow({super.key});
  final EyeExaminationsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () =>
              controller.changeEyeExaminationsType(EyeExaminationsType.gallery),
          child: TextBuilder(
            text: 'معرض الصور',
            bold: true,
            color:
                controller.eyeExaminations.value == EyeExaminationsType.gallery
                    ? AppColors.darkBlue
                    : AppColors.darkGray,
          ),
        ),
        const VerticalDividerBuilder(
          dividerColor: AppColors.darkGray,
        ),
        GestureDetector(
          onTap: () =>
              controller.changeEyeExaminationsType(EyeExaminationsType.date),
          child: TextBuilder(
            text: 'التاريخ المرضي',
            bold: true,
            color: controller.eyeExaminations.value == EyeExaminationsType.date
                ? AppColors.darkBlue
                : AppColors.darkGray,
          ),
        ),
        const VerticalDividerBuilder(
          dividerColor: AppColors.darkGray,
        ),
        GestureDetector(
          onTap: () => controller
              .changeEyeExaminationsType(EyeExaminationsType.addPhoto),
          child: TextBuilder(
            text: 'رفع صورة جديدة',
            bold: true,
            color:
                controller.eyeExaminations.value == EyeExaminationsType.addPhoto
                    ? AppColors.darkBlue
                    : AppColors.darkGray,
          ),
        ),
      ],
    );
  }
}
