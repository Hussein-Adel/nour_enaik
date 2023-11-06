import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nour_enaik/ui/screens/screens.dart';
import 'package:sizer/sizer.dart';

import 'constants/constants.dart';
import 'data/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientationل, deviceType) {
        return GetMaterialApp(
          title: AppStrings.kAppName,
          textDirection: TextDirection.rtl,
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          fallbackLocale: const Locale(
            'en',
          ),
          home: const SplashScreen(),
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            // fontFamily: 'Tajawal',
            textTheme: const TextTheme(),
            primarySwatch: Colors.blue,
          ),
        );
      },
    );
  }
}
