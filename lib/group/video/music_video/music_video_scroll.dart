// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pleng/group/video/music_video/music_video_grid.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:pleng/group/video/video_data.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

class MusicVideo extends StatefulWidget {
  @override
  State<MusicVideo> createState() => _VideoState();
}

class _VideoState extends State<MusicVideo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<YoutubePlayerController> _controller;

  @override
  void initState() {
    super.initState();
    _controller = videoURLs.map((url) {
      final videoID = YoutubePlayer.convertUrlToId(url);
      return YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    _controller.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: themeNotifier.isDarkMode ? Colors.grey[900] : Color(0xFFffffff),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildScrollVideo('Music Videos'),
        _buildVideoList(),
        // Add more widgets as needed
      ],
    );
  }

  Widget _buildScrollVideo(String title) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, top: 16.0, bottom: 12.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicVideoGrid(),
                ),
              );
            },
            child: Icon(
              Icons.chevron_right,
              color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
              size: 28, // Increase size to make it more prominent
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            videoURLs.length,
            (index) => _buildVideoItem(
              videoURL: videoURLs[index],
              title: videoTitles[index],
              singer: videoSinger[index],
              views: videoViews[index],
              controller: _controller[index],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoItem({
    required String videoURL,
    required String title,
    required String singer,
    required String views,
    required YoutubePlayerController controller,
  }) {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    final themeNotifier = context.watch<ThemeNotifier>();

    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 225,
              height: 125,
              child: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            singer,
            style: TextStyle(
              color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
          Text(
            views,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
