import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/screens/home_screen/home_screen.dart';
import 'package:money_matter/screens/home_screen/widget/custom_circle_icon_widget.dart';

import '../../../constants/colors.dart';

class BalaceCard extends StatelessWidget {
  const BalaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllTransactions();
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 70,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: 220,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            kHeight20,
            const Text(
              'Total Balance',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            kHeight20,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                '\u{20B9} ${totalBalance < 0 ? 0 : totalBalance}',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            kHeight20,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomCircleIconWidget(
                    icon: Icons.arrow_downward,
                    color: kGreenColor,
                  ),
                  kWidth10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Income',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        totalIncome.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  kWidth50,
                  CustomCircleIconWidget(
                    icon: Icons.arrow_upward,
                    color: kRedColor,
                  ),
                  kWidth10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Expense',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        totalExpense.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
