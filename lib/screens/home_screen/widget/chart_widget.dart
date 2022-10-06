import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/db/models/transaction_model.dart';

class ChartWidget extends StatefulWidget {
  final double height;
  List<FlSpot> dataSet = [];
  List<FlSpot> dataSetIncome = [];
  List<FlSpot> yearDataSetExpense = [];
  List<TransactionModel> entireData = [];

  ChartWidget({
    Key? key,
    required this.height,
    required entiredata,
  }) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 6,
              offset: const Offset(0, 4),
            )
          ],
        ),
        padding: const EdgeInsets.only(
          right: 43,
          top: 30,
          bottom: 30,
        ),
        margin: const EdgeInsets.all(12),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: const Color.fromARGB(142, 55, 67, 77),
                width: 1,
              ),
            ),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color.fromARGB(79, 55, 67, 77),
                  strokeWidth: 1,
                );
              },
            ),
            lineBarsData: [
              LineChartBarData(
                spots: getPlotPointsExpense(widget.entireData),
                isCurved: true,
                preventCurveOverShooting: true,
                belowBarData: BarAreaData(
                  show: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<FlSpot> getPlotPoints(List<TransactionModel> entireData) {
  ChartWidget chart = ChartWidget(
    height: 300,
    entiredata: entireData,
  );
  List tempDataSetIncome = [];
  final today = DateTime.now();
  for (TransactionModel data in entireData) {
    if (data.date.month == today.month && data.type == CategoryType.income) {
      tempDataSetIncome.add(data);
    }
  }

  tempDataSetIncome.sort((a, b) => a.date.day.compareTo(b.date.day));
  for (var i = 0; i < tempDataSetIncome.length; i++) {
    chart.dataSetIncome.add(
      FlSpot(
        //x axis
        tempDataSetIncome[i].date.day.toDouble(),
        //y axis
        tempDataSetIncome[i].amount.toDouble(),
      ),
    );
  }
  return chart.dataSetIncome;
}

List<FlSpot> getPlotPointsExpense(List<TransactionModel> entireData) {
  final today = DateTime.now();
  ChartWidget chart = ChartWidget(height: 300, entiredata: entireData);
  List tempDataSet = [];

  for (TransactionModel data in entireData) {
    if (data.date.month == today.month && data.type == CategoryType.expense) {
      tempDataSet.add(data);
    }
  }

  tempDataSet.sort((a, b) => a.date.day.compareTo(b.date.day));
  for (int i = 0; i < tempDataSet.length; i++) {
    chart.dataSet.add(
      FlSpot(
        //x axis
        tempDataSet[i].date.day.toDouble(),
        //y axis 
        tempDataSet[i].amount.toDouble(),
      ),
    );
  }
  return chart.dataSet;
}
