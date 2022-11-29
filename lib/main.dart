import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nba_flutter_app/homepage/home_screen.dart';
import 'package:nba_flutter_app/provider/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier()),
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: HomeScreenView(),
    );
  }
}
