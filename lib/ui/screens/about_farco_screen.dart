import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import '../components/components.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  final GeneralController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseScreen(
        isLoading: controller.isLoggedIn.value,
        verticalPadding: 0,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 7.5.h,
              ),
              Container(
                padding: EdgeInsetsDirectional.symmetric(
                    vertical: 1.1.h, horizontal: 5.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 7.5.w,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.5.w,
                    ),
                    Text(
                      maxLines: 1,
                      controller.aboutType.value == AboutType.farco
                          ? 'عن فاركو'
                          : 'نور عنيك',
                      textAlign: TextAlign.center,
                      // ToDo change Button Style
                      style: TextStyle(
                          overflow: TextOverflow.clip,
                          color: AppColors.white,
                          fontSize: AppFontSizes.kS7,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  controller.aboutModel?.desc ?? '',
                  maxLines: 60,
                  style: TextStyle(
                      color: AppColors.white, fontSize: AppFontSizes.kS5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
