import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/screens/add_transaction/add_transaction_screen.dart';
import 'package:money_matter/screens/all_transaction/all_transaction_screen.dart';
import 'package:money_matter/screens/home_screen/home_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/statitics_screen/statstics_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentSelectedIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    AllTransactionScreen(),
    AddTransactionScreen(),
    StatsticsScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    getAllTransactions();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          height:  68,
          width: 63,
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddTransactionScreen(),
                ),
              );
            },
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            pages[currentSelectedIndex],
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: const Alignment(0.0, 1.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: primaryColor,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: currentSelectedIndex,
                    onTap: (newIndex) {
                      setState(() {
                        currentSelectedIndex = newIndex;
                      });
                    },
                    backgroundColor: klightGrey,
                    items:  [
                      const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          size: 26,
                        ),
                        label: '',
                      ),
                     const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.account_balance_wallet,
                          size: 26,
                        ),
                        label: '',
                      ),
                       BottomNavigationBarItem(
                        icon: Icon(
                          Icons.add,
                          color: klightGrey,
                          size: 0,
                        ),
                        label: '',
                      ),
                     const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.bar_chart,
                          size: 26,
                        ),
                        label: '',
                      ),
                     const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          size: 26,
                        ),
                        label: '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
