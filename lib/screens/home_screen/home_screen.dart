import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/main.dart';
import 'package:money_matter/screens/home_screen/widget/chart_widget.dart';
import 'package:money_matter/screens/home_screen/widget/custom_circle_icon_widget.dart';
import 'package:money_matter/screens/home_screen/widget/recent_transactions.dart';
import 'package:money_matter/screens/home_screen/widget/time_control.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = "";

int totalBalance = 100;
int totalIncome = 0;
int totalExpense = 0;
DateTime today = DateTime.now();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getUsername();
    super.initState();
  }

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
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: transactionListNotifier,
          builder:
              (BuildContext ctx, List<TransactionModel> transactionDatas, _) {
            getTotalbalace(transactionDatas);
            return ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: secondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 17,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            timeController(),
                            Text(
                              username,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 18,
                                top: 25,
                              ),
                              child: Text(
                                'Total Balance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 13,
                                left: 20,
                                right: 25,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.currency_rupee,
                                    color: kWhiteColor,
                                    size: 50,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        '${totalBalance < 0 ? 0 : totalBalance}',
                                        style: TextStyle(
                                          color: kWhiteColor,
                                          fontSize: 50,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 25,
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    CustomCircleIconWidget(
                                      icon: Icons.arrow_downward,
                                      color: kGreenColor,
                                    ),
                                    kWidth5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    kWidth30,
                                    CustomCircleIconWidget(
                                      icon: Icons.arrow_upward,
                                      color: kRedColor,
                                    ),
                                    kWidth5,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Expenses',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      kHeight10,
                      //Chart 
                      ChartWidget(height: 300, entiredata: transactionDatas),
                      kHeight10,
                      const Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      kHeight10,
                      RecentTransactionWidget(),
                      kHeight50,
                      kHeight20,
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void getUsername() async {
    final sharedprfns = await SharedPreferences.getInstance();
    final profileName = sharedprfns.getString(saveKey);
    username = profileName!;
    setState(() {});
  }

  getTotalbalace(List<TransactionModel> entireData) {
    totalBalance = 0;
    totalIncome = 0;
    totalExpense = 0;
    for (TransactionModel data in entireData) {
      if (data.type == CategoryType.income) {
        totalBalance += data.amount;
        totalIncome += data.amount;
      } else {
        totalBalance -= data.amount;
        totalExpense += data.amount;
      }
    }
  }
}
