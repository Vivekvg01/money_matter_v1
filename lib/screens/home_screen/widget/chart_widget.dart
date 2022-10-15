import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/home_screen/home_screen.dart';
import 'package:money_matter/screens/statitics_screen/statstics_screen.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget(
      {Key? key, required this.entireData, required this.chartheight})
      : super(key: key);

  final List<TransactionModel> entireData;
  final double chartheight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: entireData.length < 2
          ? const Text(
              'No enough data to render the chart!!',
              style: TextStyle(
                fontSize: 16,
              ),
            )
          : Container(
              height: chartheight,
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
                      color: primaryColor,
                      spots: statDropDownValue == "Income" && statIndex == 1
                          ? getPlotPointsIncome(entireData)
                          : statDropDownValue == "Expense" && statIndex == 1
                              ? getPlotPointsExpense(entireData)
                              : statDropDownValue == "Income" && statIndex == 2
                                  ? getYearPlotPointsIncome(entireData)
                                  : statDropDownValue == "Expense" &&
                                          statIndex == 2
                                      ? getYearPlotPointsExpense(entireData)
                                      : getPlotPointsIncome(entireData),
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

//Expense chart points
List<FlSpot> getPlotPointsExpense(List<TransactionModel> entireData) {
  List<FlSpot> dataSet = [];
  List tempDataSet = [];
  for (TransactionModel data in entireData) {
    if (data.date.month == today.month && data.type == CategoryType.expense) {
      tempDataSet.add(data);
    }
  }
  tempDataSet.sort((a, b) => a.date.day.compareTo(b.date.day));

  for (int i = 0; i < tempDataSet.length; i++) {
    int xAxis = tempDataSet[i].date.day;
    int yAxis = tempDataSet[i].amount;

    dataSet.add(FlSpot(xAxis.toDouble(), yAxis.toDouble()));
  }
  return dataSet;
}

//Income chart points
List<FlSpot> getPlotPointsIncome(List<TransactionModel> entireData) {
  List<FlSpot> dataSet = [];
  List tempDataSet = [];
  for (TransactionModel data in entireData) {
    if (data.date.month == today.month && data.type == CategoryType.income) {
      tempDataSet.add(data);
    }
  }
  tempDataSet.sort((a, b) => a.date.day.compareTo(b.date.day));

  for (int i = 0; i < tempDataSet.length; i++) {
    int xAxis = tempDataSet[i].date.day;
    int yAxis = tempDataSet[i].amount;

    dataSet.add(FlSpot(xAxis.toDouble(), yAxis.toDouble()));
  }
  return dataSet;
}

// sum of data months

int getSumMonth(List<TransactionModel> entireData, int month,
    CategoryType transactionType) {
  int sum = 0;
  for (TransactionModel transaction in entireData) {
    if (transaction.date.month == month &&
        transaction.type == transactionType) {
      sum += transaction.amount;
    }
  }
  return sum;
}

//year Income chart
List<FlSpot> getYearPlotPointsIncome(List<TransactionModel> entireData) {
  List yearTempDataSetIncome = [];
  List<FlSpot> dataSet = [];

  for (int i = 0; i <= 12; i++) {
    yearTempDataSetIncome.add(getSumMonth(entireData, i, CategoryType.income));
  }
  for (int i = 0; i < yearTempDataSetIncome.length; i++) {
    int yAxis = yearTempDataSetIncome[i];
    dataSet.add(FlSpot(i + 1.toDouble(), yAxis.toDouble()));
  }
  return dataSet;
}

//year Expense chart
List<FlSpot> getYearPlotPointsExpense(List<TransactionModel> entireData) {
  List yearTempDataSetExpense = [];
  List<FlSpot> dataSet = [];

  for (int i = 0; i <= 12; i++) {
    yearTempDataSetExpense
        .add(getSumMonth(entireData, i, CategoryType.expense));
  }
  for (int i = 0; i < yearTempDataSetExpense.length; i++) {
    int yAxis = yearTempDataSetExpense[i];
    dataSet.add(FlSpot(i + 1.toDouble(), yAxis.toDouble()));
  }
  return dataSet;
}
