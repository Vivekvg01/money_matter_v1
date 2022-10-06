import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/screens/all_transaction/widgets/view_all_transaction_widget.dart';
import '../../constants/colors.dart';

String timeLinerFileterValue = "All";
String monthFilterValue = "Jan";

class AllTransactionScreen extends StatefulWidget {
  AllTransactionScreen({Key? key}) : super(key: key);

  @override
  State<AllTransactionScreen> createState() => _AllTransactionScreenState();
}

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

  final categoryItemFilter = <String>['All', 'Income', 'Expense'];

  final timelineItemFilter = <String>['All', 'Today', 'Yesterday', 'Month'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'All Transaction',
          style: TextStyle(color: kblackColor),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Row(
            children: [
              //income-expense dropdown
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
              //Timeline-dropdown
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.27,
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
                    value: timeLinerFileterValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        timeLinerFileterValue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              kWidth10,
              //Month Filter dropdown
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.27,
                decoration: BoxDecoration(
                  color: timeLinerFileterValue == "Month"
                      ? primaryColor
                      : const Color.fromARGB(255, 198, 196, 196),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: DropdownButton(
                    disabledHint: const Text('Month'),
                    menuMaxHeight: 200,
                    iconEnabledColor: kWhiteColor,
                    items: timelineItemFilter == 'Month' ?
                        showMonths.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }).toList() : null,
                    value: monthFilterValue,
                    onChanged: (String? newValue){
                      monthFilterValue = newValue!;
                    },
                  ),
                ),
              )
            ],
          ),
          kHeight10,
          ViewAllTransactions(),
          const SizedBox(
            height: 90,
          )
        ],
      ),
    );
  }
}
