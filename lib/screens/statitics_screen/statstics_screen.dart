import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/all_transaction/all_transaction_screen.dart';
import 'package:money_matter/screens/home_screen/widget/chart_widget.dart';
import '../all_transaction/widgets/view_all_transaction_widget.dart';

class StatsticsScreen extends StatefulWidget {
  const StatsticsScreen({Key? key}) : super(key: key);

  @override
  State<StatsticsScreen> createState() => _StatsticsScreenState();
}

class _StatsticsScreenState extends State<StatsticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Statistics',
          style: TextStyle(color: kblackColor),
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: transactionListNotifier,
          builder: (BuildContext ctx, List<TransactionModel> transactionDatas,
              Widget? _) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Row(
                  children: [
                    kWidth10,
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primaryColor,
                      ),
                      child: Center(
                        child: DropdownButton(
                          iconEnabledColor: kWhiteColor,
                          dropdownColor: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          underline: const SizedBox(),
                          items: categoryItemFilter
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                          value: dropDownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    kWidth10,
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Oct',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    kWidth10,
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'This Year',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    kHeight50,
                  ],
                ),
                kHeight20,
                ChartWidget(
                  entireData: transactionDatas,
                  chartheight: 500,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
