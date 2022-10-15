import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/db/models/transaction_model.dart';
import 'package:money_matter/main.dart';
import 'package:money_matter/screens/home_screen/widget/balance_card.dart';
import 'package:money_matter/screens/home_screen/widget/chart_widget.dart';
import 'package:money_matter/screens/home_screen/widget/custom_circle_icon_widget.dart';
import 'package:money_matter/screens/home_screen/widget/recent_transactions.dart';
import 'package:money_matter/screens/home_screen/widget/time_control.dart';
import 'package:money_matter/screens/statitics_screen/statstics_screen.dart';
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
    statIndex = 1;
    statDropDownValue = "Expense";
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
    getAllTransactions();
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
                    //background container
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
                    //Balace Card
                    const BalaceCard(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Expense',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      kHeight20,
                      //Chart
                      ChartWidget(
                        entireData: transactionDatas,
                        chartheight: 400,
                      ),
                      kHeight20,
                      const Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      kHeight10,
                      RecentTransactionWidget(),
                      const SizedBox(height: 80),
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
