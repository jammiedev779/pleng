import 'package:flutter/material.dart';
import 'package:pleng/assets/images/images.dart';

class PlaylistDetailScreen extends StatelessWidget {
  final String imageUrl;

  PlaylistDetailScreen({required this.imageUrl});

  final List<String> images = AppImages.images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6b6a8d), // Lighter greyish color
                    Color(0xFF2a2a3b), // Darker color
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Top bar with return arrow and 3-dot icon
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {
                      // Add your action here
                    },
                  ),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 40.0), // Adjust according to your needs
                Center(
                  child: Image.network(
                    imageUrl,
                    height: MediaQuery.of(context).size.height *
                        0.2, // Take 40% of the screen height
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Still Viral',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'By Pleng',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  '1.9K Plays • 21 Songs • 68 min',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: () {
                        // Action for favorite button
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.shuffle, color: Colors.white),
                      onPressed: () {
                        // Action for shuffle button
                      },
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.play_arrow),
                      onPressed: () {
                        // Action for play button
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.file_download, color: Colors.white),
                      onPressed: () {
                        // Action for download button
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.white),
                      onPressed: () {
                        // Action for share button
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Image.network(
                          images[1],
                          height: 50.0,
                        ),
                        title: Text('deja vu',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('Olivia Rodrigo',
                            style: TextStyle(color: Colors.white70)),
                        trailing: IconButton(
                          icon: Icon(Icons.file_download, color: Colors.white),
                          onPressed: () {
                            // Action for download button
                          },
                        ),
                      ),
                      ListTile(
                        leading: Image.network(
                          images[2],
                          height: 50.0,
                        ),
                        title: Text('Tom\'s Diner',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('AnnenMayKantereit, Giant Rooks',
                            style: TextStyle(color: Colors.white70)),
                        trailing: IconButton(
                          icon: Icon(Icons.file_download, color: Colors.white),
                          onPressed: () {
                            // Action for download button
                          },
                        ),
                      ),
                      ListTile(
                        leading: Image.network(
                          images[3],
                          height: 50.0,
                        ),
                        title: Text('Fall In Love Alone',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('Stacey Ryan',
                            style: TextStyle(color: Colors.white70)),
                        trailing: IconButton(
                          icon: Icon(Icons.file_download, color: Colors.white),
                          onPressed: () {
                            // Action for download button
                          },
                        ),
                      ),
                      ListTile(
                        leading: Image.network(
                          images[4],
                          height: 50.0,
                        ),
                        title: Text('Too Sweet',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('Hozier',
                            style: TextStyle(color: Colors.white70)),
                        trailing: IconButton(
                          icon: Icon(Icons.file_download, color: Colors.white),
                          onPressed: () {
                            // Action for download button
                          },
                        ),
                      ),
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
}
