import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/widgets/common_textfeild.dart';
import 'package:money_matter/screens/add_transaction/widget/choice_chip_widget.dart';
import 'package:money_matter/screens/add_transaction/widget/date_pick_widget.dart';
import 'package:money_matter/widgets/custom_round_rect_button.dart';
import 'package:money_matter/widgets/delete_popup_widget.dart';

class EditTransactionScreen extends StatelessWidget {
  EditTransactionScreen({
    Key? key,
    required this.amount,
    required this.category,
    required this.editedDate,
    required this.dataIndex,
    required this.editedType,
  }) : super(key: key);

  final String amount;
  final String category;
  final DateTime editedDate;
  final int dataIndex;
  final CategoryType editedType;

  final TextEditingController amountEditController = TextEditingController();
  final TextEditingController categoryEditController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    amountEditController.text = amount;
    categoryEditController.text = category;
    selectedDate = editedDate;
    type = editedType;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                deletePopup(context, dataIndex);
              },
              icon: Icon(
                Icons.delete_rounded,
                color: kRedColor,
                size: 20,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ListView(
                children: [
                  const Text(
                    'Edit Transaction',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeight50,
                  CommonTexFeildWidget(
                    icon: Icons.currency_rupee,
                    controller: amountEditController,
                    hintText: "Amount",
                    validator: amountEditController.text,
                    validateText: "Amount cant't be empty",
                    inputTextType: TextInputType.number,
                  ),
                  kHeight20,
                  CommonTexFeildWidget(
                    icon: Icons.category,
                    controller: categoryEditController,
                    hintText: 'Category',
                    validator: categoryEditController.text,
                    validateText: "Category can't be empty",
                  ),
                  kHeight20,
                  const ChoiceChipWidget(),
                  kHeight20,
                  DatePickWidget(),
                  kHeight20,
                  CustomRoundRectButton(
                    buttonLabel: "Update",
                    onButtonClicked: () {
                      if (_formkey.currentState!.validate()) {
                        onUpdateButtonClicked(context);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onUpdateButtonClicked(BuildContext context) {
    final editedAmound = int.parse(amountEditController.text);
    final editedTransaction = TransactionModel(
      editedAmound,
      selectedDate,
      categoryEditController.text,
      type,
    );

    updateTransaction(editedTransaction, dataIndex);

    if (amount != amountEditController.text ||
        category != categoryEditController.text ||
        selectedDate != editedDate ||
        type != editedType) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Transaction Updated'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
