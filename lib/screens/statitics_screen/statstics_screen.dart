import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';

class StatsticsScreen extends StatelessWidget {
  const StatsticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Statistics',
          style: TextStyle(color: kblackColor),
        ),
      ),
      body: Center(),
    );
  }
}
