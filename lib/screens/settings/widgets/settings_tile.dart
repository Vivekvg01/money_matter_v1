import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';

class SettingsTile extends StatelessWidget {
  SettingsTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    this.trailingIcon,
    required this.onTap,
  }) : super(key: key);

  final IconData leadingIcon;
  final String title;
  final Function onTap;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            leadingIcon,
            color: kblackColor,
            size: 30,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 19),
          ),
          trailing: Icon(trailingIcon),
          onTap: onTap(),
        ),
      ],
    );
  }
}
