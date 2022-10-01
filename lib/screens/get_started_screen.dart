import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/screens/name_enter_screen.dart';
import 'package:money_matter/widgets/custom_round_rect_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/man 3d.png',
                height: 300,
                width: 300,
              ),
              const Text(
                'Strengthen Your Financial \nFuture !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
              const Text(
                'Money Matter helps you to improve your financial management\nby tracking your income and expenses.You can add your\ntransactions to money matter and improve your personal\n finance. Money matter provides chart and graphs by\nanalyzing your transaction.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff4D4C4C),
                ),
              ),
              kHeight10,
              CustomRoundRectButton(
                buttonLabel: 'Get Started',
                onButtonClicked: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => NameEnterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
