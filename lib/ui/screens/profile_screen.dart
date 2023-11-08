import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';
import '../../data/models/response/user_response.dart';
import '../components/components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    User? user = authController.currentUser?.user;
    return BaseScreen(
      horizontalPadding: 1.5.w,
      verticalPadding: 1.5.h,
      titleAppBar: AppStrings.kMyAccount,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              EmptyCard(
                horizontalMargin: 0,
                verticalMargin: 0,
                horizontalPadding: 5.w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextBuilder(
                          text: 'الإسم :',
                          color: AppColors.gray,
                          // alignment: AlignmentDirectional.centerStart,
                          verticalPadding: 1.h,
                        ),
                        TextBuilder(
                          text: user?.name,
                          verticalPadding: 1.h,
                          horizontalPadding: 1.5.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextBuilder(
                          text: 'البريد الإليكترونى :', verticalPadding: 1.h,
                          color: AppColors.gray,
                          // alignment: AlignmentDirectional.centerStart,
                        ),
                        TextBuilder(
                          text: user?.email,
                          verticalPadding: 1.h,
                          horizontalPadding: 1.5.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextBuilder(
                          text: "الهاتف :",
                          // alignment: AlignmentDirectional.centerStart,
                          color: AppColors.gray, verticalPadding: 1.h,
                        ),
                        TextBuilder(
                          text: user?.phone,
                          verticalPadding: 1.h,
                          horizontalPadding: 1.5.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                top: 0.5.h,
                end: 2.5.w,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  // onPressed: () => showModalBottomSheet(
                  //   context: context,
                  //   backgroundColor: Colors.transparent,
                  //   isScrollControlled: true,
                  //   builder: (context) {
                  //     return const EditInformationBottomSheet();
                  //   },
                  // ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      getDefaultSvgIcon(
                          image: AppAssets.kEditIcon,
                          color: AppColors.cyan,
                          height: 2.25,
                          width: 2.25),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1.25.w,
                        ),
                        child: Text(
                          AppStrings.kEdit,
                          style: TextStyle(
                              color: AppColors.cyan,
                              fontSize: AppFontSizes.kS2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                Colors.transparent,
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 2.5.h),
              ),
            ),
            // onPressed: () => showModalBottomSheet(
            //   context: context,
            //   backgroundColor: Colors.transparent,
            //   isScrollControlled: true,
            //   builder: (context) {
            //     return const ChangePasswordBottomSheet();
            //   },
            // ),
            onPressed: () {},
            child: EmptyCard(
              verticalMargin: 0,
              horizontalMargin: 1.w,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                    child: const Icon(
                      Icons.lock_outlined,
                      color: AppColors.cyan,
                    ),
                  ),
                  TextBuilder(
                    text: AppStrings.kChangePassword,
                    verticalPadding: 0,
                    size: AppFontSizes.kS3,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: AppFontSizes.kS5,
                    color: AppColors.cyan,
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
