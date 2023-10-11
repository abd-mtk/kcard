import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomChart extends StatelessWidget {
  final List<FlSpot> spots;
  final List<Color> gradientColors;
  final Color backgroundColor;

  const CustomChart(
      {Key? key,
      required this.spots,
      this.backgroundColor = Colors.black,
      this.gradientColors = const [Colors.green, Colors.blue, Colors.pink]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.blue,
                  tooltipRoundedRadius: 8,
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                    return lineBarsSpot.map((lineBarSpot) {
                      return LineTooltipItem(
                        lineBarSpot.y.toString(),
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              backgroundColor: backgroundColor,
              lineBarsData: [
                LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: gradientColors
                            .map((color) => color.withOpacity(0.3))
                            .toList(),
                      ),
                    ),
                    dotData: const FlDotData(show: true)),
              ],
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: true,
                getDrawingVerticalLine: (value) => FlLine(
                  color: Colors.grey.withOpacity(0.2),
                  strokeWidth: 1,
                ),
              ),
              titlesData: const FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
