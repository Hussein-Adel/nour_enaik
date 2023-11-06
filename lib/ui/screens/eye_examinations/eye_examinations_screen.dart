import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/data/networks/network_constant.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../controllers/controllers.dart';
import '../../components/components.dart';
import '../screens.dart';

class EyeExaminationsScreen extends StatelessWidget {
  EyeExaminationsScreen({super.key, required this.title});
  final String title;
  final EyeExaminationsController controller =
      Get.put(EyeExaminationsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseScreen(
        isLoading: controller.isLoading.value,
        verticalPadding: 0,
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppFontSizes.kS9,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(width: 12.5.w),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: EmptyCard(
                verticalPadding: 0.5.h,
                verticalMargin: 0,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExaminationsRow(),
                      controller.eyeExaminations.value ==
                              EyeExaminationsType.date
                          ? EyeExaminationsDates()
                          : controller.eyeExaminations.value ==
                                  EyeExaminationsType.gallery
                              ? GridView.builder(
                                  itemCount: controller.allImages?.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 0.9,
                                          mainAxisSpacing: 0.1.w,
                                          crossAxisSpacing: 0.25.w),
                                  itemBuilder: (_, index) {
                                    return FullScreenWidget(
                                        disposeLevel: DisposeLevel.Medium,
                                        child: EmptyCard(
                                          radius: 7.5,
                                          horizontalMargin: 1.5.w,
                                          verticalMargin: 0.5.h,
                                          url: NetworkConstant.kImageUrl +
                                              controller.allImages![index],
                                          child: const SizedBox(),
                                        ));
                                  },
                                )
                              : AddEyeExamination(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
