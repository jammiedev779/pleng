import 'package:flutter/material.dart';
import 'package:pleng/group/main_menu/main_menu.dart';
import 'home_page/all_home.dart';

class PlengApp extends StatelessWidget {
  const PlengApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MainMenu(),
    );
  }
}