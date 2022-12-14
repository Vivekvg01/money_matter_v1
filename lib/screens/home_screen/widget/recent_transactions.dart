import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/edit_transaction/edit_transaction.dart';

// ignore: must_be_immutable
class RecentTransactionWidget extends StatelessWidget {
  RecentTransactionWidget({Key? key}) : super(key: key);

  List<String> months = [
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
    return ValueListenableBuilder(
      valueListenable: transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> transactionList, _) {
        final List<TransactionModel> tempList =
            transactionList.reversed.toList();
        return ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (ctx, index) {
            final transactionDetails = tempList[index];
            return Container(
              height: 73.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: klightGrey,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      transactionDetails.type == CategoryType.income
                          ? kGreenColor
                          : kRedColor,
                  radius: 28,
                  child: Icon(
                    transactionDetails.type == CategoryType.income
                        ? Icons.arrow_downward
                        : Icons.arrow_upward,
                    color: kWhiteColor,
                  ),
                ),
                title: Text(
                  transactionDetails.type == CategoryType.income
                      ? "Credit"
                      : "Debit",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    '${transactionDetails.date.day} ${months[transactionDetails.date.month - 1]}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${transactionDetails.type == CategoryType.income ? '+' : '-'} ${transactionDetails.amount.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(transactionDetails.category),
                  ],
                ),
                onTap: () {
                  int dbIndex = tempList.length - index - 1;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (contxt) {
                        return EditTransactionScreen(
                          amount: transactionDetails.amount.toString(),
                          category: transactionDetails.category,
                          editedDate: transactionDetails.date,
                          dataIndex: dbIndex,
                          editedType: transactionDetails.type,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
            height: 10,
          ),
          itemCount: tempList.length < 5 ? tempList.length : 5,
        );
      },
    );
  }
}
