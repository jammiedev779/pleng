// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pleng/group/current_play/icon_blur.dart';
import 'package:pleng/group/current_play/pop_up_more.dart';
import 'dart:ui';


class CurrentPlay extends StatelessWidget {
  final List<Map<String, String>> musicList;

  CurrentPlay({required this.musicList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: musicList.length,
      itemBuilder: (context, index) {
        final music = musicList[index];
        return _buildMusicItem(
          context: context,
          backgroundImageUrl: music['backgroundImageUrl']!,
          musicTitle: music['musicTitle']!,
          artist: music['artist']!,
        );
      },
    );
  }

  Widget _buildMusicItem({
    required BuildContext context,
    required String backgroundImageUrl,
    required String musicTitle,
    required String artist,
  }) {
    return Container(
      child: Stack(
        children: [
          // Background image from URL
          Positioned.fill(
            child: Image.network(
              backgroundImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Bottom gradient blur effect
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color.fromARGB(26, 76, 75, 75).withOpacity(0.4),
                    const Color.fromARGB(26, 71, 69, 69).withOpacity(0.2),
                    Color.fromARGB(0, 218, 33, 33),
                  ],
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () {},
            ),
          ),
          // Top right share icon
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                BlurCircleAvatar(
                  icon: Icons.cast_connected_outlined,
                  onTap: () {
                    // Handle the tap event for the CircleAvatar
                  },
                ),
              ],
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
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 57, 56, 56),
                          borderRadius: BorderRadius.circular(
                              24.0), // Adjust the radius as needed
                        ),
                        child: Text(
                          'Recommended',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.music_note, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            musicTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        artist,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      BlurCircleAvatar(
                        icon: Icons.person,
                        onTap: () {
                          // Handle the tap event for the CircleAvatar
                        },
                      ),
                      SizedBox(height: 18.0),
                      BlurCircleAvatar(
                        icon: Icons.favorite_border,
                        onTap: () {
                          // Handle the tap event for the CircleAvatar
                        },
                      ),
                      Text(
                        '9,630',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 18.0),
                      BlurCircleAvatar(
                        icon: Icons.cloud_done_rounded,
                        onTap: () {
                          // Handle the tap event for the CircleAvatar
                        },
                      ),
                      SizedBox(height: 18.0),
                      BlurCircleAvatar(
                        icon: Icons.share_outlined,
                        onTap: () {
                          
                        },
                      ),
                      SizedBox(height: 18.0),
                      BlurCircleAvatar(
                        icon: Icons.more_horiz_outlined,
                        onTap: () {
                          showBottomSheetOptions(context);
                        },
                      ),
                      SizedBox(height: 60.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.play_arrow, color: Colors.white),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: Slider(
                            value: 0,
                            onChanged: (value) {},
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                          ),
                        ),
                        Text(
                          "03:39",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
