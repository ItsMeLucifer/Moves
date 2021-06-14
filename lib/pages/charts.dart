import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:productivity/main.dart';

class Charts extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final handler = watch(appHandlerViewModel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 64,
        ),
        Center(
          child: Text(
            'Last Week',
            style: TextStyle(
              fontSize: 30,
              color: handler.textColor3,
              fontFamily: handler.fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        Center(child: LineChartSample2()),
        SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'Last Week Avg',
            style: TextStyle(
              fontSize: 30,
              color: handler.textColor3,
              fontFamily: handler.fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Card(
          color: Color(0xff232d37),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.only(top: 16),
          elevation: 0.5,
          child: Container(
              height: 150,
              width: 400,
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Center(
                child: Text(
                  "45% \n \n You can do better!",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white70,
                    fontFamily: handler.fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        )
      ],
    );
  }
}

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, child) {
        final firebaseServiceVM = watch(firebaseServiceViewModel);
        return Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.70,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    color: Color(0xff232d37)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(mainData())),
              ),
            ),
          ],
        );
      },
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 32,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            print(value);
            switch (value.toInt()) {
              case 1:
                return 'MON';
              case 2:
                return 'TUE';
              case 3:
                return 'WEN';
              case 4:
                return 'THU';
              case 5:
                return 'FRI';
              case 6:
                return 'SAT';
              case 7:
                return 'SUN';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 2:
                return '20';
              case 3:
                return '30';
              case 4:
                return '40';
              case 5:
                return '50';
              case 6:
                return '60';
              case 7:
                return '70';
              case 8:
                return '80';
              case 9:
                return '90';
              case 10:
                return '100';
            }
            return '';
          },
          reservedSize: 20,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 3),
            FlSpot(2, 4),
            FlSpot(3, 7),
            FlSpot(4, 9),
            FlSpot(5, 6),
            FlSpot(6, 3),
            FlSpot(7, 0),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
