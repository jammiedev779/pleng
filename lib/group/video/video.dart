import 'package:flutter/material.dart';
import 'package:pleng/group/headbar/head_bar.dart';

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
    return Scaffold(
      appBar: HeadBar(),
      body: Container(
        color: Colors.grey[900],
        alignment: Alignment.center,
      ),
    );
  }
}
