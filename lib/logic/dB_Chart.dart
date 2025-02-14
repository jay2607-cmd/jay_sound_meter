import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// pending testing on different device

class DBChart extends StatelessWidget {
  const DBChart({
    super.key,
    required this.chartData,
  });

  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFFEDEEEF), width: 1.5),
        ),
        child: SfCartesianChart(
          title: ChartTitle(
              text: 'dB Graph',
              textStyle: TextStyle(color: Color(0xFFE1E4E8), fontSize: 13),
              alignment: ChartAlignment.far),
          series: <AreaSeries<ChartData, double>>[
            // LineSeries<ChartData, double>(
            //   dataLabelSettings: const DataLabelSettings(
            //     // isVisible: true,
            //   ),
            //   dataSource: chartData,
            //   xAxisName: 'Time',
            //   yAxisName: 'dB',
            //   name: 'dB values over time',
            //   xValueMapper: (ChartData value, _) => value.frames,
            //   yValueMapper: (ChartData value, _) => value.maxDB?.floor(),
            //   animationDuration: 1
            // ),

            AreaSeries(
                gradient: LinearGradient(
                    colors: [Color(0xFFCEE9FF), Color(0xFF35A1FF)],
                    stops: [0.2, 1]),
                borderWidth: 3,
                dataSource: chartData,
                xValueMapper: (ChartData value, _) => value.frames,
                yValueMapper: (ChartData value, _) => value.maxDB?.floor(),
                borderGradient: LinearGradient(
                    colors: [Color(0xFFCEE9FF), Color(0xFF35A1FF)],
                    stops: [0.2, 1]))
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final double? maxDB;
  final double? meanDB;
  final double frames;

  ChartData(this.maxDB, this.meanDB, this.frames);
}
