import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';

class NoteWidget extends StatelessWidget {
  NoteWidget({Key? key}) : super(key: key);

  String note = "Some Notes";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: klightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          kWidth10,
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.library_books,
              color: Colors.white,
              size: 23,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Note on Transaction",
                border: InputBorder.none,
              ),
              onChanged: (val) => note = val,
            ),
          ),
        ],
      ),
    );
  }
}
