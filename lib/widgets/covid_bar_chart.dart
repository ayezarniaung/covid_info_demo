import 'package:covid_19_info_demo/configs/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  const CovidBarChart({
    Key key,
    @required this.covidCases,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily New Cases',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 16,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    margin: 10,
                    showTitles: true,
                    rotateAngle: 35.0,
                    getTextStyles: (double value) {
                      return Styles.chartLabelTextStyle;
                    },
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'May 24';
                        case 1:
                          return 'May 25';
                        case 2:
                          return 'May 26';
                        case 3:
                          return 'May 27';
                        case 4:
                          return 'May 28';
                        case 5:
                          return 'May 29';
                        case 6:
                          return 'May 30';

                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    margin: 10,
                    getTextStyles: (value) {
                      return Styles.chartLabelTextStyle;
                    },
                    getTitles: (value) {
                      if (value == 0) {
                        return '0';
                      } else if (value % 3 == 0) {
                        return '${value ~/ 3 * 5} K';
                      }
                      return '';
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 3 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    strokeWidth: 1,
                    dashArray: [5],
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: covidCases
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        BarChartGroupData(
                          barRods: [
                            BarChartRodData(
                              y: value,
                              colors: [
                                Colors.red,
                              ],
                            ),
                          ],
                          x: key,
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
