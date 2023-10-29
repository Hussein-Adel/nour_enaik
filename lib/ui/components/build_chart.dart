import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/constants.dart';
import 'empty_card.dart';

class BuilderChart extends StatelessWidget {
  const BuilderChart(
      {Key? key, required this.chartData, required this.max, required this.min})
      : super(key: key);
  final List<ReadingData> chartData;
  final int max;
  final int min;
  @override
  Widget build(BuildContext context) {
    return EmptyCard(
      height: 25.h,
      verticalMargin: 0,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            maximum: max.toDouble(),
            minimum: min.toDouble(),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(color: AppColors.darkGray)),
        series: <LineSeries<ReadingData, String>>[
          LineSeries<ReadingData, String>(
            color: AppColors.liteBlue,
            dataSource: chartData,
            xValueMapper: (ReadingData sales, _) => sales.date,
            yValueMapper: (ReadingData sales, _) => sales.reading,
            width: 2,
            markerSettings:
                const MarkerSettings(isVisible: true, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

class ReadingData {
  ReadingData(this.date, this.reading);

  final String date;
  final int reading;
}
