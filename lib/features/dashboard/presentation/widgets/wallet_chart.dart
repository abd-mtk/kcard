import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'chart_container.dart';

class WalletChart extends StatelessWidget {
  final List<FlSpot> spots;
  final List<double> minMax;
  final String title;

  const WalletChart(
      {super.key,
      required this.spots,
      required this.minMax,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ChartContainer(spots: spots, title: title),
    );
  }
}
