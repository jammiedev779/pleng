import 'package:flutter/material.dart';
import 'package:pleng/group/headbar/head_bar.dart';
import 'package:pleng/group/video/music_video/music_video_scroll.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

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
    final themeNotifier = context.watch<ThemeNotifier>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: HeadBar(onLanguageToggle: _toggleLanguage, isKhmer: _isKhmer),
      body: Container(
        color: themeNotifier.isDarkMode ? Colors.grey[900] : Color(0xFFffffff),
        alignment: Alignment.center,
        child: MusicVideo(),
      ),
    );
  }
}
