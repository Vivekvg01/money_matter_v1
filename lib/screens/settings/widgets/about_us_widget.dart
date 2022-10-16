import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/widgets/custom_round_rect_button.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'About Us',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          kHeight30,
          const Text(
            'Money Matter is an application which helps to improve your personal finance.We provides graphs by tracking your transactions.',
            textAlign: TextAlign.center,
          ),
          kHeight20,
          CustomRoundRectButton(
            buttonLabel: '\tOk\t',
            onButtonClicked: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
