//Reminder bottom sheet
import 'package:flutter/material.dart';
import 'package:money_matter/screens/home_screen/home_screen.dart';

void reminderBottomSheet(ctx) {
  showModalBottomSheet(
      context: ctx, builder: (BuildContext context) => HomeScreen());
}
