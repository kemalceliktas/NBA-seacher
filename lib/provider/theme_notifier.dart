import 'package:flutter/material.dart';
import 'package:nba_flutter_app/globalconst/theme_data.dart';

class ThemeNotifier extends ChangeNotifier{

 

  ThemeData get currentTheme =>  DarkTheme().darkTheme;
}