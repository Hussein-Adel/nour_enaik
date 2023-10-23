import 'package:flutter/cupertino.dart';
import 'package:nour_enaik/ui/screens/alarm_screen.dart';
import 'package:nour_enaik/ui/screens/main_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/login': (context) => NourEnaikMainScreen(),
  '/compare_screen': (context) => AlarmScreen(),
};
