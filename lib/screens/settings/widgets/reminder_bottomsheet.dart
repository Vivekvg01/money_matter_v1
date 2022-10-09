import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/screens/add_transaction/widget/add_transaction_textfeild_widget.dart';
import 'package:money_matter/widgets/custom_round_rect_button.dart';

class ReminderBottomSheet extends StatelessWidget {
  ReminderBottomSheet({Key? key}) : super(key: key);

  TextEditingController reminderController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 1,
      width: double.infinity,
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              kHeight10,
              Text(
                'Set Reminder',
                style: GoogleFonts.lato(fontSize: 19),
              ),
              kHeight30,
              CommonTexFeildWidget(
                icon: Icons.lightbulb,
                controller: reminderController,
                hintText: 'What to Remind?',
                validator: reminderController.text,
                validateText: 'Enter what to remind',
              ),
              kHeight10,
              TextButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(
                      hour: 12,
                      minute: 0,
                    ),
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
                buttonLabel: 'Done',
                onButtonClicked: () {
                  _formKey.currentState!.validate();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
