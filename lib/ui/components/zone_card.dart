import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import 'components.dart';

class ZoneCard extends StatelessWidget {
  const ZoneCard(
      {Key? key,
      required this.tittle,
      this.timeController,
      this.contentsColor,
      this.onSaved})
      : super(key: key);
  final String tittle;
  final Color? contentsColor;
  final Function(DateTime?)? onSaved;
  final TextEditingController? timeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 1.5.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.darkGray.withOpacity(0.75),
            width: 1.25.sp,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBuilder(
            verticalPadding: 0.75.h,
            horizontalPadding: 1.5.w,
            text: tittle,
          ),
          EmptyCard(
            color: AppColors.lightGrey,
            horizontalPadding: 1.w,
            radius: 25,
            // height: 6.h,
            horizontalMargin: 0,
            // horizontalPadding: dateController != null ? 2.5.w : 6.5.w,
            verticalPadding: 0,
            verticalMargin: 0,
            child: TextFormFieldBuilder(
              isEnabled: false,
              controller: timeController,
              onTap: () async {
                TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (timeOfDay != null) {
                  var timeNow = DateTime.now();
                  DateTime dateTime = DateTime(timeNow.year, timeNow.month,
                      timeNow.day, timeOfDay.hour, timeOfDay.minute);
                  var dateFormat = DateFormat.Hm('en').format(dateTime);
                  timeController!.text = dateFormat.toString();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class DateTimeBuilder extends StatelessWidget {
  const DateTimeBuilder({
    Key? key,
    this.timeController,
  }) : super(key: key);
  final TextEditingController? timeController;

  @override
  Widget build(BuildContext context) {
    var timeShowController = TextEditingController();
    timeShowController = timeController ?? TextEditingController();
    /* String? format = formatTimePickerJm(timeShowController.text);
    timeController?.text = format!;*/
    return EmptyCard(
      color: AppColors.lightGrey,
      horizontalPadding: 1.w,
      radius: 25,
      // height: 6.h,
      horizontalMargin: 0,
      // horizontalPadding: dateController != null ? 2.5.w : 6.5.w,
      verticalPadding: 0,
      verticalMargin: 0,
      child: TextFormFieldBuilder(
        isEnabled: false,
        controller: timeShowController,
        onTap: () async {
          TimeOfDay? timeOfDay = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (timeOfDay != null) {
            var timeNow = DateTime.now();
            DateTime dateTime = DateTime(timeNow.year, timeNow.month,
                timeNow.day, timeOfDay.hour, timeOfDay.minute);
            var dateFormat = DateFormat.Hm('en').format(dateTime);
            timeShowController.text = dateFormat.toString();
            timeController!.text = dateFormat.toString();
          }
        },
      ),
    );
  }

  String? formatTimePickerJm(String? time) {
    if (time != null) {
      var spiltTimeList = time.split(':');

      int hour = int.parse(spiltTimeList[0]);
      int minute = int.parse(spiltTimeList[1]);
      DateTime now = DateTime.now().copyWith(hour: hour, minute: minute);
      return DateFormat.jm().format(now);
    }
    return null;
  }
}
