// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:pleng/group/video/video_data.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pleng/provider/theme_notifier.dart';

class LivePerformanceGrid extends StatefulWidget {
  final bool isKhmer;
  final VoidCallback toggleLanguage;

  LivePerformanceGrid({required this.isKhmer, required this.toggleLanguage});
  @override
  State<LivePerformanceGrid> createState() => _VideoState();
}

class _VideoState extends State<LivePerformanceGrid> {
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
      appBar: AppBar(
        backgroundColor:
            themeNotifier.isDarkMode ? Color(0xFF1f1f1f) : Color(0xFFffffff),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
        title: Text(
          widget.isKhmer ? 'ការសម្តែងផ្ទាល់':'Live Performance',
          style: TextStyle(
            color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      key: _scaffoldKey,
      body: Container(
        color: themeNotifier.isDarkMode ? Colors.grey[900] : Color(0xFFffffff),
        child: _buildVideoList(),
      ),
    );
  }

  Widget _buildVideoList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.9,
        ),
        itemCount: videoURLs.length,
        itemBuilder: (context, index) {
          return _buildVideoItem(
            videoURL: videoURLs[index],
            title: videoTitles[index],
            singer: videoSinger[index],
            views: videoViews[index],
            controller: _controller[index],
          );
        },
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
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 225,
              height: 100,
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
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            singer,
            style: TextStyle(
              color: themeNotifier.isDarkMode ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
          Text(
            views,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
