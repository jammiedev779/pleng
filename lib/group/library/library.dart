import 'package:flutter/material.dart';

class Library extends StatelessWidget {
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
      color: Colors.yellow,
      alignment: Alignment.center,
    );
  }
}
