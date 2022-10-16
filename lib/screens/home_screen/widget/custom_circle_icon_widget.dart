import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';

class CustomCircleIconWidget extends StatelessWidget {
 const CustomCircleIconWidget({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 17,
        backgroundColor: color,
        child: Icon(
          icon,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
