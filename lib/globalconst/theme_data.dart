import 'dart:ui';

import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData darkTheme = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        color: DarkColor().bgColor,
        elevation: 0,
        
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: TextStyle(
              color: DarkColor().textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              color: DarkColor().subTitle,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            bodyMedium: TextStyle(
              color: DarkColor().textColor,
              fontSize: 16,
              fontWeight: FontWeight.w300,

            ),
          ),
        scaffoldBackgroundColor: DarkColor().bgColor,
           
     );
}

class DarkColor {
  final Color textColor = Color.fromARGB(255, 223, 239, 250);
  final Color cardColor = Color(0xFF0F4C75).withOpacity(0.4);
  final Color bgColor = Color(0xff1B262C);
  final Color subTitle = Colors.white.withOpacity(0.6);
  final Color buttonColor = Color(0xff3282B8);
  final Color iconColor = Color(0xFFBBE1FA);
  final Color iconBgColor = Color(0xFF0F4C75);
}
