import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nour_enaik/ui/screens/screens.dart';
import 'package:sizer/sizer.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const GetMaterialApp(
          title: AppStrings.kAppName,
          textDirection: TextDirection.rtl,
          debugShowCheckedModeBanner: false,
          locale: Locale('ar'),
          home: NourEnaikWelcomeScreen(),
        );
      },
    );
  }
}
