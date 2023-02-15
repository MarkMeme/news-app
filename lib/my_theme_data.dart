import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = const Color(0xFF39A552);
  static Color blackColor = const Color(0xFF4F5A69);
  static Color whiteColor = Colors.white;
  static Color greyColor = const Color(0xFFA3A3A3);

  static ThemeData lightMode = ThemeData(
    primaryColor: primaryColor,
    iconTheme: IconThemeData(color: blackColor),
    appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: whiteColor),
        actionsIconTheme: IconThemeData(color: whiteColor)),
    textTheme: TextTheme(
        headline1: TextStyle( // appbar
            color: whiteColor, fontWeight: FontWeight.bold, fontSize: 25),
        subtitle1: TextStyle( // pick
            color: blackColor, fontSize: 22, fontWeight: FontWeight.bold),
        subtitle2: TextStyle( // one category item
          color: whiteColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        ),
    scaffoldBackgroundColor: Colors.transparent,
  );
}