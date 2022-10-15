import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/screens/all_transaction/widgets/view_all_transaction_widget.dart';
import '../../constants/colors.dart';

class AllTransactionScreen extends StatefulWidget {
  AllTransactionScreen({Key? key}) : super(key: key);

  @override
  State<AllTransactionScreen> createState() => _AllTransactionScreenState();
}

String dataFilterValue = "All";
String monthFilterValue = "Jan";

final categoryItemFilter = <String>['All', 'Income', 'Expense'];
final timelineItemFilter = <String>['All', 'Today', 'Yesterday', 'Month'];

class _AllTransactionScreenState extends State<AllTransactionScreen> {
  final List<String> showMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    getAllTransactions();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'All Transaction',
          style: TextStyle(color: kblackColor),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 16,right: 16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //income-expense dropdown
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: dataFilterValue == "Month"
                      ? MediaQuery.of(context).size.width * 0.28
                      : MediaQuery.of(context).size.width * 0.43,
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
                //Timeline-dropdown
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: dataFilterValue == "Month"
                      ? MediaQuery.of(context).size.width * 0.28
                      : MediaQuery.of(context).size.width * 0.43,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: DropdownButton(
                      iconEnabledColor: kWhiteColor,
                      dropdownColor: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      underline: const SizedBox(),
                      items: timelineItemFilter
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
                      value: dataFilterValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dataFilterValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                kWidth10,
                //Month Filter dropdown
                Visibility(
                  visible: dataFilterValue == "Month" ? true : false,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.26,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: dataFilterValue == 'Month'
                          ? primaryColor
                          : kWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: DropdownButton(
                        menuMaxHeight: 200,
                        underline: const Text(''),
                        iconEnabledColor: Colors.white,
                        dropdownColor: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        items: dataFilterValue == 'Month'
                            ? showMonths
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
                              }).toList()
                            : null,
                        value: monthFilterValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            monthFilterValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            kHeight20,
            const ViewAllTransactions(),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
