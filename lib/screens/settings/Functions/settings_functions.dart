import 'package:flutter/material.dart';
import 'package:money_matter/db/functions/db_functions.dart';
import 'package:money_matter/screens/splash_screen.dart';
import 'package:url_launcher/url_launcher.dart';

//ResetData PopUp
void resetAllDatas(ctx) {
  showDialog(
    context: (ctx),
    builder: (builder) {
      return AlertDialog(
        title: const Text("Reset All Datas?"),
        content: const Text('Do you really want to reset the data?'),
        actions: [
          TextButton(
            onPressed: () {
              resetDB();
              resetSharedPrefs();
              Navigator.of(ctx).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (ctx) => const SplashScreen(),
                ),
                (route) => false,
              );
            },
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

//Feedback mail sending
Future<void> sendMail() async {
  final Uri url = Uri.parse(
      'mailto:vivekveuns021@gmail.com?subject=Feedback About Xpense App&body=');
  if (!await launchUrl(url)) {
    throw 'Could not launch';
  }
}


