// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pleng/group/current_play/icon_blur.dart';

void showBottomSheetOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: Container(
          color: Color.fromARGB(255, 24, 23, 23),
          height: 1600.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        BlurCircleAvatar(
                          icon: Icons.shuffle,
                          onTap: () {},
                          backgroundPadding: 10.0,
                          iconColor: Color.fromARGB(0, 114, 111, 111),
                          iconSize: 30,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Shuffer',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 48.0),
                    Column(
                      children: [
                        BlurCircleAvatar(
                          icon: Icons.repeat_rounded,
                          onTap: () {},
                          iconColor: Color.fromARGB(0, 114, 111, 111),
                          backgroundPadding: 10.0,
                          iconSize: 30,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Repeat',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 48.0),
                    Column(
                      children: [
                        BlurCircleAvatar(
                          icon: Icons.favorite_border,
                          onTap: () {},
                          iconColor: Color.fromARGB(0, 114, 111, 111),
                          backgroundPadding: 10.0,
                          iconSize: 30,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Favorite',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 48.0),
                    Column(
                      children: [
                        BlurCircleAvatar(
                          icon: Icons.cloud_done_rounded,
                          onTap: () {},
                          iconColor: Color.fromARGB(0, 114, 111, 111),
                          backgroundPadding: 10.0,
                          iconSize: 30,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Download',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ListTile(
                  leading: Icon(Icons.playlist_add),
                  iconColor: Colors.white,
                  title: Text(
                    'Add to playlist',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Handle add to playlist action
                  },
                ),
                ListTile(
                  leading: Icon(Icons.queue_music),
                  iconColor: Colors.white,
                  title: Text(
                    'Go to Queue',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Handle go to queue action
                  },
                ),
                ListTile(
                  leading: Icon(Icons.my_library_music_rounded),
                  iconColor: Colors.white,
                  title: Text(
                    'Song Details',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Handle song details action
                  },
                ),
                ListTile(
                  leading: Icon(Icons.high_quality),
                  iconColor: Colors.white,
                  title: Text(
                    'Streaming quality',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Handle streaming quality action
                  },
                ),
                ListTile(
                  leading: Icon(Icons.add_to_photos),
                  iconColor: Colors.white,
                  title: Text(
                    'Post as story',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    // Handle post as story action
                  },
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 100, 98, 98),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25.0), // Add border radius
                        side: BorderSide(
                            color: const Color.fromARGB(255, 165, 160, 160),
                            width: 0.8), // Add border color and width
                      ),
                    ),
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
