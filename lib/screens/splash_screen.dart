import 'dart:async';
import 'package:flutter/material.dart';
import 'package:money_matter/constants/colors.dart';
import 'package:money_matter/main.dart';
import 'package:money_matter/screens/get_started_screen.dart';
import 'package:money_matter/widgets/bottom_navigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Image.asset(
          'assets/caption logo.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }

  Future<void> toGetStartedScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return const GetStartedScreen();
        },
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getString(saveKey);

    if (userLoggedIn == null || userLoggedIn.isEmpty) {
      return toGetStartedScreen();
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) {
            return const BottomNavigationBarWidget();
          },
        ),
      );
    }
  }
}
