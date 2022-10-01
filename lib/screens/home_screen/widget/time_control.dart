import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_matter/constants/colors.dart';

DateTime timeChecker = DateTime.now();

timeController() {
  if (timeChecker.hour >= 0 && timeChecker.hour < 12) {
    return Text(
      'Good Morning ,',
      style: GoogleFonts.acme(
        color: kWhiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  } else if (timeChecker.hour >= 12 && timeChecker.hour < 16) {
    return Text(
      'Good After Noon ,',
      style: GoogleFonts.acme(
        color: kWhiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  } else {
    return Text(
      'Good Evening ,',
      style: GoogleFonts.acme(
        color: kWhiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
