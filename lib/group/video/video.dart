import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  // const HomeScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: const Color.fromARGB(255, 255, 59, 59),
      alignment: Alignment.center,
    );
  }
}
