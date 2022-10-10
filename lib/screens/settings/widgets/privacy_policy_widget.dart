import 'package:flutter/material.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/widgets/custom_round_rect_button.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          kHeight30,
          const Text(
            'This privacy notice for money matter application describes how this application collects and store your data',
          ),
          kHeight20,
          CustomRoundRectButton(
            buttonLabel: '\tOk\t',
            onButtonClicked: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
