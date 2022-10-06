import 'dart:ui';

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
            children: [
              //reminder
              ReminderWidget(),
              kHeight5,
              //reset app data
              ListTile(
                leading: Icon(
                  Icons.restart_alt_outlined,
                  color: kblackColor,
                  size: 30,
                ),
                title: const Text(
                  'Reset App Data',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: () {},
              ),
              //privacy policy
              kHeight5,
              ListTile(
                leading: Icon(
                  Icons.privacy_tip,
                  color: kblackColor,
                  size: 30,
                ),
                title: const Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: () {},
              ),
              //rate this app
              kHeight5,
              ListTile(
                leading: Icon(
                  Icons.star,
                  color: kblackColor,
                  size: 30,
                ),
                title: const Text(
                  'Rate this app',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: () {},
              ),
              //Feedback
              kHeight5,
              ListTile(
                leading: Icon(
                  Icons.feedback,
                  color: kblackColor,
                  size: 30,
                ),
                title: const Text(
                  'Feedback',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                onTap: (){},
              ),
              //About Us
              kHeight5,
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: kblackColor,
                  size: 30,
                ),
                title: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}
