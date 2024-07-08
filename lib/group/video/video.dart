import 'package:flutter/material.dart';
import 'package:pleng/group/headbar/head_bar.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isKhmer = false;

  void _toggleLanguage() {
    setState(() {
      _isKhmer = !_isKhmer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: HeadBar(onLanguageToggle: _toggleLanguage, isKhmer: _isKhmer),
      body: Container(
        color: Colors.grey[900],
        alignment: Alignment.center,
      ),
    );
  }
}
