import 'package:flutter/material.dart';
import 'package:pleng/group/headbar/head_bar.dart';
import 'package:pleng/group/video/khmer_music/khmer_music_scroll.dart';
import 'package:pleng/group/video/live_performance/live_performance.dart';
import 'package:pleng/group/video/music_video/music_video_scroll.dart';
import 'package:pleng/group/video/new_age/new_age_scroll.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

class Video extends StatefulWidget {
  final bool isKhmer;
  final VoidCallback toggleLanguage;

  Video({required this.isKhmer, required this.toggleLanguage});
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
  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: HeadBar(onLanguageToggle: widget.toggleLanguage, isKhmer: widget.isKhmer),
      body: Container(
        color: themeNotifier.isDarkMode ? Colors.grey[900] : Color(0xFFffffff),
        alignment: Alignment.center,
        child: ListView(
          children: [
            Container(
              height: 300,
              child: MusicVideo(isKhmer: widget.isKhmer, toggleLanguage: widget.toggleLanguage),
            ),
            Container(
              height: 300,
              child: LivePerformance(isKhmer: widget.isKhmer, toggleLanguage: widget.toggleLanguage),
            ),
            Container(
              height: 300,
              child: KhmerMusicScroll(isKhmer: widget.isKhmer, toggleLanguage: widget.toggleLanguage),
            ),
            Container(
              height: 300,
              child: NewAgeScroll(isKhmer: widget.isKhmer, toggleLanguage: widget.toggleLanguage),
            ),
          ],
        ),
      ),
    );
  }
}
