import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/widgets/common_textfeild.dart';
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
                  onButtonClicked: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
