import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/constants.dart';
import 'empty_card.dart';

class BuilderChart extends StatelessWidget {
  const BuilderChart(
      {Key? key, required this.chartData, required this.max, required this.min})
      : super(key: key);
  final List<ChartData> chartData;
  final int max;
  final int min;
  @override
  Widget build(BuildContext context) {
    return EmptyCard(
      height: 25.h,
      verticalMargin: 0,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            maximum: chartData[chartData.length - 1].x.toDouble() + 10,
            minimum: 0,
            interval: 10,
            majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            maximum: max.toDouble(),
            minimum: min.toDouble(),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(color: AppColors.darkGray)),
        series: <LineSeries<ChartData, num>>[
          LineSeries<ChartData, num>(
            color: AppColors.liteBlue,
            dataSource: chartData,
            xValueMapper: (ChartData sales, _) => sales.x,
            yValueMapper: (ChartData sales, _) => sales.y,
            width: 2,
            markerSettings:
                const MarkerSettings(isVisible: true, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  int y;
}
