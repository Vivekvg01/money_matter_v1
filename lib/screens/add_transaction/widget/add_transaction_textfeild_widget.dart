import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';

class CommonTexFeildWidget extends StatelessWidget {
  const CommonTexFeildWidget({
    Key? key,
    required this.icon,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.validateText,
    this.inputTextType,
  }) : super(key: key);

  final IconData icon;
  final TextEditingController controller;
  final String hintText;
  final String validator;
  final TextInputType? inputTextType;
  final String validateText;

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
            child: Icon(
              icon,
              color: Colors.white,
              size: 23,
            ),
          ),
          kWidth10,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 14,
              ), 
              child: TextFormField(  
                maxLines: 1,
                validator: (validator) {
                  if (validator == null || validator.isEmpty) {
                    return validateText;
                  } else {
                    return null;
                  }
                },
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  hintText: hintText,
                  border: InputBorder.none,
                ),
                keyboardType: inputTextType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
