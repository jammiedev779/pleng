import 'package:flutter/material.dart';
import 'components/home_page/all_home.dart';

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