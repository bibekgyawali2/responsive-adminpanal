import 'package:ecommerce_admin/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 70,
          sectionsSpace: 0,
          startDegreeOffset: -90,
          sections: pieChartSelectionDatas,
        ),
      ),
    );
  }
}

List<PieChartSectionData> pieChartSelectionDatas = [
  PieChartSectionData(
    color: primaryColor,
    value: 20,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Colors.amber,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: const Color.fromARGB(255, 19, 65, 103),
    value: 10,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Colors.red,
    value: 30,
    showTitle: false,
    radius: 25,
  ),
];
