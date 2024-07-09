import 'dart:ui';

import 'package:flutter/material.dart';

class CurrentPlay extends StatelessWidget {
  final String backgroundImageUrl;
  final String musicTitle;
  final String artist;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  CurrentPlay({
    required this.backgroundImageUrl,
    required this.musicTitle,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: const Color.fromARGB(255, 59, 255, 85),
      alignment: Alignment.center,
      child: Stack(
        children: [
          // Background image from URL
          Positioned.fill(
            child: Image.network(
              backgroundImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Top left back arrow
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {},
            ),
          ),
          // Top right share icon
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.share, color: Colors.white),
              onPressed: () {},
            ),
          ),
          // Center bottom music information
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommended',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.music_note, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            musicTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        artist,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      _buildBlurCircleAvatar(
                        icon: Icons.person,
                        onTap: () {
                          // Handle the tap event for the second CircleAvatar
                        },
                      ),
                      SizedBox(height: 18.0),
                      _buildBlurCircleAvatar(
                        icon: Icons.favorite,
                        onTap: () {
                          // Handle the tap event for the second CircleAvatar
                        },
                      ),
                      SizedBox(height: 18.0),
                      _buildBlurCircleAvatar(
                        icon: Icons.download,
                        onTap: () {
                          // Handle the tap event for the second CircleAvatar
                        },
                      ),
                      SizedBox(height: 18.0),
                      _buildBlurCircleAvatar(
                        icon: Icons.share,
                        onTap: () {
                          // Handle the tap event for the second CircleAvatar
                        },
                      ),
                      SizedBox(height: 18.0),
                      _buildBlurCircleAvatar(
                        icon: Icons.more_horiz,
                        onTap: () {
                          // Handle the tap event for the second CircleAvatar
                        },
                      ),
                      SizedBox(height: 18.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurCircleAvatar(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(icon, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

