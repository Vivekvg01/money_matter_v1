import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/screens/add_transaction/widget/add_transaction_textfeild_widget.dart';
import 'package:money_matter/screens/settings/widgets/reminder_notification.dart';
import 'package:money_matter/widgets/bottom_navigationbar.dart';
import 'package:money_matter/widgets/custom_round_rect_button.dart';

class ReminderBottomSheet extends StatefulWidget {
  const ReminderBottomSheet({Key? key}) : super(key: key);

  @override
  State<ReminderBottomSheet> createState() => _ReminderBottomSheetState();
}

class _ReminderBottomSheetState extends State<ReminderBottomSheet> {
  TimeOfDay? pickedTime;
  TimeOfDay currentTimme = TimeOfDay.now();
  final TextEditingController reminderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ReminderNotification().init(initScheduled: true);
  }

  void listenNotifiication() {
    ReminderNotification.onNotifications.listen((onClickNotification));
  }

  onClickNotification(String? payload) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return const BottomNavigationBarWidget();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        child: Container(
          height: 550,
          color: kWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                kHeight10,
                const Text(
                  'Set Reminder',
                  style: TextStyle(fontSize: 19),
                ),
                kHeight30,
                CommonTexFeildWidget(
                  icon: Icons.lightbulb,
                  controller: reminderController,
                  hintText: 'What to Remind?',
                  validator: reminderController.text,
                  validateText: 'Enter what to remind',
                  inputTextType: TextInputType.text,
                ),
                kHeight10,
                TextButton(
                  onPressed: () async {
                    pickedTime = await showTimePicker(
                      context: context,
                      initialTime: currentTimme,
                      initialEntryMode: TimePickerEntryMode.dial,
                    );
                  },
                  child: const Text(
                    'Set Timer',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                kHeight10,
                CustomRoundRectButton(
                  buttonLabel: '\tOK\t',
                  onButtonClicked: () {
                    print(pickedTime.toString());
                    if (pickedTime != null && pickedTime != currentTimme) {
                      setState(
                        () {
                          ReminderNotification.showScheduledNotifications(
                            title: 'Money Matter',
                            body: reminderController.text,
                            scheduledTime: Time(
                              pickedTime!.hour,
                              pickedTime!.minute,
                              0,
                            ),
                          );
                        },
                      );
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
