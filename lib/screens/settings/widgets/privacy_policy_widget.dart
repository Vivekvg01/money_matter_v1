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
            'This privacy notice for money matter application describes how this application collects and store your informations.\v \t\t This application has a local databse storage system,which means this application stores your data locally in your device.So you dont have to worry about your dataIf you have any concerns connect @support.moneymatter.com.',
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
