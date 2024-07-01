import 'package:flutter/material.dart';
import 'package:pleng/group/main_menu/main_menu.dart';
import 'home_page/all_home.dart';

class PlengApp extends StatefulWidget {
  const PlengApp({super.key});

  @override
  _PlengAppState createState() => _PlengAppState();
}

class _PlengAppState extends State<PlengApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MainMenu(toggleTheme: _toggleTheme),
    );
  }
}
