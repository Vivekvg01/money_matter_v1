import 'package:flutter/material.dart';
import 'package:money_matter/db/functions/db_functions.dart';

deletePopup(BuildContext context, int index) {
  Widget deleteButton = TextButton(
    onPressed: () {
      Navigator.of(context).pop();
      deleteTransaction(index);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
           duration: Duration(seconds: 1),
          content: Text('Transaction deleted'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.of(context).pop();
    },
    child: const Text('Delete'),
  );

  Widget cancelButton = TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: const Text('Cancel'),
  );

  AlertDialog alert = AlertDialog(
    title: const Text('Delete this transaction?'),
    content: const Text("This is permanent and can't be undone"),
    actions: [
      cancelButton,
      deleteButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) => alert,
  );
}
