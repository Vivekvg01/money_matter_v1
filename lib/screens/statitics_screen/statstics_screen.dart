import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/home_screen/widget/chart_widget.dart';

class ScreenStatistics extends StatefulWidget {
  const ScreenStatistics({Key? key}) : super(key: key);

  @override
  State<ScreenStatistics> createState() => _ScreenStatisticsState();
}

int statIndex = 1;

bool page = true;
String statDropDownValue = 'Income';

class _ScreenStatisticsState extends State<ScreenStatistics> {
  final items = <String>['Income', 'Expense'];
  @override
  Widget build(BuildContext context) {
    //page = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Statistics',
          style: TextStyle(color: kblackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SizedBox(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.27,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: DropdownButton<String>(
                              iconEnabledColor: Colors.white,
                              dropdownColor: primaryColor,
                              style: const TextStyle(color: Colors.white),
                              underline: const Text(''),
                              borderRadius: BorderRadius.circular(10),
                              items: items.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: statDropDownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  statDropDownValue = newValue!;
                                });
                              }),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                statIndex = 1;
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.27,
                              decoration: BoxDecoration(
                                color: statIndex == 1
                                    ? primaryColor
                                    : const Color.fromARGB(255, 186, 185, 185),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'This Month',
                                  style: TextStyle(
                                    color: statIndex == 1
                                        ? Colors.white
                                        : const Color.fromARGB(255, 99, 98, 98),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                statIndex = 2;
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.27,
                              decoration: BoxDecoration(
                                color: statIndex == 2
                                    ? primaryColor
                                    : const Color.fromARGB(255, 186, 185, 185),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'This Year',
                                  style: TextStyle(
                                    color: statIndex == 2
                                        ? Colors.white
                                        : const Color.fromARGB(255, 99, 98, 98),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: transactionListNotifier,
                      builder: (BuildContext ctx,
                          List<TransactionModel> transactionDatas, _) {
                        return ChartWidget(
                          entireData: transactionDatas,
                          chartheight: 500,
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
