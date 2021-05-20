import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class Charts extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandler);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Last Month',
            style: TextStyle(
              fontSize: 30,
              color: handler.textColor3,
              fontFamily: handler.fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: handler.secondaryColor,
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 30.0, top: 30.0, bottom: 10, left: 0),
              child: LineChart(
                LineChartData(
                    minX: 0,
                    maxX: 30,
                    minY: 0,
                    maxY: 99,
                    titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => TextStyle(
                                  color: handler.textColor3,
                                  fontFamily: handler.fontFamily,
                                ),
                            getTitles: (value) {
                              if (value % 7 == 0) {
                                return (value.toInt() + 1).toString();
                              } else {
                                return "";
                              }
                            }),
                        leftTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => TextStyle(
                                  color: handler.textColor3,
                                  fontFamily: handler.fontFamily,
                                ),
                            getTitles: (value) {
                              if (value % 10 == 0) {
                                return value.toInt().toString();
                              } else {
                                return "";
                              }
                            })),
                    lineBarsData: [
                      LineChartBarData(
                          spots: [
                            FlSpot(0, 30),
                            FlSpot(1, 15),
                            FlSpot(3, 10),
                            FlSpot(6, 90),
                            FlSpot(20, 70)
                          ],
                          isCurved: true,
                          colors: [handler.primaryColor],
                          barWidth: 5,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(
                              show: true,
                              colors: [handler.primaryColor.withOpacity(0.3)]))
                    ],
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(color: Colors.grey[300], strokeWidth: 1);
                      },
                      drawVerticalLine: true,
                      getDrawingVerticalLine: (value) {
                        return FlLine(color: Colors.grey[300], strokeWidth: 1);
                      },
                    ),
                    borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.grey[300], width: 1))),
                swapAnimationDuration: Duration(milliseconds: 150),
              ),
            ),
          ),
        )
      ],
    );
  }
}
