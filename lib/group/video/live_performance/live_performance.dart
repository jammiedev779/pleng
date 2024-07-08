// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pleng/group/video/live_performance/live_performance_grid.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:pleng/group/video/video_data.dart';
import 'package:flutter/widgets.dart';

class LivePerformance extends StatefulWidget {
  @override
  State<LivePerformance> createState() => _VideoState();
}

class _VideoState extends State<LivePerformance> {
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
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.grey[900],
        child: _buildBodyLivePerformance(),
      ),
    );
  }

  Widget _buildBodyLivePerformance() {
    return Column(
      children: [
        _buildScrollVideo('Live Performance'),
        _buildVideoList(),
        // Add more widgets as needed
      ],
    );
  }

  Widget _buildScrollVideo(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 12.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LivePerformanceGrid(),
                ),
              );
            },
            child: Icon(
              Icons.chevron_right,
              color: Colors.white,
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
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            singer,
            style: TextStyle(
              color: Colors.white,
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
