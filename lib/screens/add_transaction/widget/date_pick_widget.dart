import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';

DateTime selectedDate = DateTime.now();

class DatePickWidget extends StatefulWidget {
  DatePickWidget({Key? key}) : super(key: key);

  @override
  State<DatePickWidget> createState() => _DatePickWidgetState();
}

class _DatePickWidgetState extends State<DatePickWidget> {
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.date_range,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
                kWidth5,
                Text(
                  "${selectedDate.day} ${months[selectedDate.month - 1]}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            onTap: () {
              _selectedDate(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2090, 1),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
