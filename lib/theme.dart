import 'package:flutter/material.dart';

MaterialColor primaryMaterialColor = const MaterialColor(
  4278200831,
  <int, Color>{
    50: Color.fromRGBO(
      0,
      41,
      255,
      .1,
    ),
    100: Color.fromRGBO(
      0,
      41,
      255,
      .2,
    ),
    200: Color.fromRGBO(
      0,
      41,
      255,
      .3,
    ),
    300: Color.fromRGBO(
      0,
      41,
      255,
      .4,
    ),
    400: Color.fromRGBO(
      0,
      41,
      255,
      .5,
    ),
    500: Color.fromRGBO(
      0,
      41,
      255,
      .6,
    ),
    600: Color.fromRGBO(
      0,
      41,
      255,
      .7,
    ),
    700: Color.fromRGBO(
      0,
      41,
      255,
      .8,
    ),
    800: Color.fromRGBO(
      0,
      41,
      255,
      .9,
    ),
    900: Color.fromRGBO(
      0,
      41,
      255,
      1,
    ),
  },
);
 
ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xff0029ff),
  primarySwatch: primaryMaterialColor,
);
