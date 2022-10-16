import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/screens/home_screen/home_screen.dart';
import 'package:money_matter/screens/home_screen/widget/custom_circle_icon_widget.dart';
import '../../../constants/colors.dart';

class BalaceCard extends StatelessWidget {
  const BalaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> dataList, _) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 72,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: 215,
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(
                color: kWhiteColor,
                width: 3,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: kblackColor,
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Column(
              children: [
                kHeight30,
                Text(
                  'Total Balance',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                kHeight10,
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: SingleChildScrollView(
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
                ),
                kHeight10,
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
                            '\u{20B9} $totalIncome',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
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
                            '\u{20B9} $totalExpense',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
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
      },
    );
  }
}
