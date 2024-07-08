import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pleng/group/main_menu/main_menu.dart';
import 'home_page/all_home.dart';

class PlengApp extends StatefulWidget {
  const PlengApp({super.key});

  @override
  _PlengAppState createState() => _PlengAppState();
}

class _PlengAppState extends State<PlengApp> {
  bool _isKhmer = false;

  void _toggleLanguage() {
    setState(() {
      _isKhmer = !_isKhmer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(isKhmer: _isKhmer, toggleLanguage: _toggleLanguage),
    );
  }
}
