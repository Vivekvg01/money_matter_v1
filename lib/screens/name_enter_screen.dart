import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/constants/constants.dart';
import 'package:money_matter/main.dart';
import 'package:money_matter/widgets/bottom_navigationbar.dart';
import 'package:money_matter/widgets/custom_round_rect_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameEnterScreen extends StatelessWidget {
  NameEnterScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/blue logo.png',
                  height: 100,
                  width: 100,
                ),
                kHeight20,
                const Text(
                  'What should we call\nyou?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight10,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please Enter Your Name';
                      }else{
                        return null;
                      }
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Nick Name',
                      contentPadding: const EdgeInsets.all(15),
                      filled: true,
                      fillColor: klightGrey,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                CustomRoundRectButton(
                  buttonLabel: 'Submit',
                  onButtonClicked: () {
                    if (_formkey.currentState!.validate()) {
                      onSubmitButtonClicked(context);
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

  void onSubmitButtonClicked(ctx) async {
    final sharedprfns = await SharedPreferences.getInstance();
    if (nameController.text.isNotEmpty) {
      sharedprfns.setString(saveKey, nameController.text);
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) {
            return const BottomNavigationBarWidget();
          },
        ),
      );
    }
  }
}
