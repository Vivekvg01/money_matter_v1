import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/screens/settings/widgets/reminder_bottomsheet.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.notifications,
        size: 30,
        color: kblackColor,
      ),
      title: const Text(
        'Reminder',
        style: TextStyle(fontSize: 19),
      ),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (builder) {
              return  ReminderBottomSheet();
            });
      },
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
    );
  }
}
