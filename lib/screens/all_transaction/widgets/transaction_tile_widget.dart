//Expense Tile Widget
import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/all_transaction/widgets/view_all_transaction_widget.dart';
import 'package:money_matter/screens/edit_transaction/edit_transaction.dart';

//Income Tile Widget
Widget incomeTileWidget(
    BuildContext context, TransactionModel transactionDetails, int index) {
  return Container(
   margin: const EdgeInsets.all(6),
    height: 73.5,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: klightGrey,
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: kGreenColor,
        radius: 28,
        child: Icon(
          Icons.arrow_downward,
          color: kWhiteColor,
        ),
      ),
      title: const Text(
        "Credit",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${transactionDetails.date.day} ${months[transactionDetails.date.month - 1]}',
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '+ ${transactionDetails.amount.toString()}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(transactionDetails.category),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (contxt) {
              return EditTransactionScreen(
                amount: transactionDetails.amount.toString(),
                category: transactionDetails.category,
                editedDate: transactionDetails.date,
                dataIndex: index,
                editedType: transactionDetails.type,
              );
            },
          ),
        );
      },
    ),
  );
}

//Expense Tile Widget

Widget expenseTileWidget(
    BuildContext context, TransactionModel transactionDetails, int index) {
  return Container(
    margin: const EdgeInsets.all(6),
    height: 73.5,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: klightGrey,
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: kRedColor,
        radius: 28,
        child: Icon(
          Icons.arrow_upward,
          color: kWhiteColor,
        ),
      ),
      title: const Text(
        "Debit",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${transactionDetails.date.day} ${months[transactionDetails.date.month - 1]}',
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '- ${transactionDetails.amount.toString()}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(transactionDetails.category),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (contxt) {
              return EditTransactionScreen(
                amount: transactionDetails.amount.toString(),
                category: transactionDetails.category,
                editedDate: transactionDetails.date,
                dataIndex: index,
                editedType: transactionDetails.type,
              );
            },
          ),
        );
      },
    ),
  );
}
