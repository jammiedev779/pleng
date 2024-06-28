import 'package:flutter/material.dart';
import 'home_page.dart';

class PlengApp extends StatelessWidget {
  const PlengApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}