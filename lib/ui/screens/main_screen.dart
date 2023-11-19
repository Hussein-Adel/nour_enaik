import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../controllers/controllers.dart';
import '../components/bottom_navigator.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await controller.onWillPop(context);
      },
      child: Obx(
        () => Scaffold(
            extendBody: true,
            backgroundColor: AppColors.liteWight,
            bottomNavigationBar: BottomNavigator(
              onChanged: (index) => controller.onBottomSheetChanged(index),
              index: controller.currentIndex.value,
            ),
            body: controller.homeScreensList[controller.currentIndex.value]),
      ),
    );
  }
}
