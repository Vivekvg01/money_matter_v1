import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/add_transaction/widget/add_transaction_textfeild_widget.dart';
import 'package:money_matter/screens/add_transaction/widget/choice_chip_widget.dart';
import 'package:money_matter/screens/add_transaction/widget/date_pick_widget.dart';
import 'package:money_matter/widgets/custom_round_rect_button.dart';

class AddTransactionScreen extends StatelessWidget {
  AddTransactionScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 30,
            right: 30,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text(
                  'Add Transaction',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight50,
                AddTransactionTextFeildWidget(
                  icon: Icons.currency_rupee,
                  controller: amountController,
                  hintText: 'Amount',
                  validator: amountController.text,
                  validateText: 'please enter amount',
                  inputTextType: TextInputType.number,
                ),
                kHeight20,
                AddTransactionTextFeildWidget(
                  icon: Icons.category,
                  controller: categoryController,
                  hintText: 'Category',
                  validator: categoryController.text,
                  validateText: 'please enter category',
                ),
                kHeight20,
                const ChoiceChipWidget(),
                kHeight20,
                DatePickWidget(),
                kHeight20,
                CustomRoundRectButton(
                  buttonLabel: 'Add',
                  onButtonClicked: () {
                    if (_formKey.currentState!.validate()) {
                      final amount = int.parse(amountController.text);
                      final category = categoryController.text;
                      final sample = TransactionModel(
                        amount,
                        selectedDate,
                        category,
                        type,
                      );
                      addTransactions(sample);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
