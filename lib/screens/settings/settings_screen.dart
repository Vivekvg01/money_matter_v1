import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/screens/settings/widgets/settings_tile.dart';

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
              SettingsTile(
                leadingIcon: Icons.notifications,
                title: "Reminder",
                trailingIcon: Icons.arrow_forward_ios,
                onTap: () {},
              ),
              SettingsTile(
                leadingIcon: Icons.replay_circle_filled_outlined,
                title: "Reset App",
                onTap: () {},
              ),
              SettingsTile(
                leadingIcon: Icons.privacy_tip,
                title: "Privacy Policy",
                onTap: () {},
              ),
              SettingsTile(
                leadingIcon: Icons.share,
                title: "Share",
                onTap: () {},
              ),
              SettingsTile(
                leadingIcon: Icons.star_outlined,
                title: "Rate this app",
                onTap: () {},
              ),
              SettingsTile(
                leadingIcon: Icons.feedback_rounded,
                title: "Feedback",
                onTap: () {},
              ),
              SettingsTile(
                leadingIcon: Icons.info,
                title: "About Us",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
