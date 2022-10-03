import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/screens/settings/widgets/reminder_widget.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
          style: TextStyle(color: kblackColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              ReminderWidget(),
              kHeight10,
            ],
          ),
        ),
      ),
    );
  }
}
