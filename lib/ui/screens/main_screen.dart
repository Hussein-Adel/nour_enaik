import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/ui/controllers/controllers.dart';

import '../../../../constants/colors.dart';
import '../components/bottom_navigator.dart';

class NourEnaikMainScreen extends StatelessWidget {
  NourEnaikMainScreen({Key? key}) : super(key: key);
  final MainScreenController controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await controller.onWillPop(context);
      },
      child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.liteWight,
          bottomNavigationBar: BottomNavigator(
            onChanged: (index) =>
                controller.onBottomSheetChanged(index, context),
            index: controller.currentIndex,
          ),
          body: controller.homeScreensList[controller.currentIndex]),
    );
  }
}
