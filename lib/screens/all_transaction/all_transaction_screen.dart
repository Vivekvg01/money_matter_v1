import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/all_transaction/widgets/view_all_transaction_widget.dart';
import '../../constants/colors.dart';

class AllTransactionScreen extends StatefulWidget {
  AllTransactionScreen({Key? key}) : super(key: key);

  @override
  State<AllTransactionScreen> createState() => _AllTransactionScreenState();
}

String dropDownValue = "All";

class _AllTransactionScreenState extends State<AllTransactionScreen> {
  final List<String> months = [
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

  final transactionItems = ['All', 'Income', 'Expense'];

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
              // Income /Expense filter dropdown.
              ValueListenableBuilder(
                valueListenable: transactionListNotifier,
                builder: (BuildContext ctx, List<TransactionModel>transactionList, _){
                  return Container(
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
                      items: transactionItems
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
                  );
                },
                
              ),
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
