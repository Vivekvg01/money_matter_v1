import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';

class CustomRoundRectButton extends StatelessWidget {
  final String buttonLabel;
  final Function onButtonClicked;
  
  const CustomRoundRectButton({
    Key? key,
    required this.buttonLabel,
    required this.onButtonClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onButtonClicked();
      },
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        elevation: 0,
      ),
      child: Text(buttonLabel),
    );
  }
}
