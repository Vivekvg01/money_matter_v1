import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import '../../../constants/colors.dart';

CategoryType type = CategoryType.income;

class ChoiceChipWidget extends StatefulWidget {
  const ChoiceChipWidget({Key? key}) : super(key: key);

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: Text(
            'Income',
            style: TextStyle(
              color: type == CategoryType.income ? kWhiteColor : kblackColor,
            ),
          ),
          selected: type == CategoryType.income ? true : false,
          selectedColor: primaryColor,
          onSelected: (val) {
            if (val) {
              setState(() {
                type = CategoryType.income;
              });
            }
          },
        ),
        kWidth10,
        ChoiceChip(
          labelStyle: const TextStyle(),
          label: Text(
            'Expense',
            style: TextStyle(
              color: type == CategoryType.expense ? kWhiteColor : kblackColor,
            ),
          ),
          selected: type == CategoryType.expense ? true : false,
          selectedColor: primaryColor,
          onSelected: (val) {
            if (val) {
              setState(
                () {
                  type = CategoryType.expense;
                },
              );
            }
          },
        ),
      ],
    );
  }
}
